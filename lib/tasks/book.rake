require 'optparse'
namespace :book do
  def get_pre_content(path)
    pre_content = ''
    begin
      File.open(path) do |io|
        10.times do
          _temp_content = io.gets
          if _temp_content.size > 300
            _temp_content = _temp_content[0, 300]
            break
          end
          pre_content += _temp_content
        end
      end
      puts "....init book preview content: #{path}".green
    rescue => e
      puts "#{e.message}".red
    end
    pre_content
  end

  def init_book_list(category)
    path_prefix = "lib/utils/books/"
    path = path_prefix + category + '.yml'

    FileUtils.cd(path_prefix) do
      FileUtils.rm Dir.glob('*.yml')
    end

    unless File.exist? path
      origin_path = BOOK_PATH_PREFIX + category + '/'
      File.open(path, 'w') do |io|
        FileUtils.cd(origin_path) do
          files = Dir.glob("*.[tT][xX][tT]")
          files.each do |file_name|
            _zh_name = file_name.split('.')[0]
            _en_name = Pinyin.t(_zh_name, splitter: '')
            io.puts _en_name + ':'
            io.puts "  name: " + _zh_name
          end
        end
      end
    end

    books = YAML.load_file(path).deep_symbolize_keys
    books.each do |_, v|
      book = Book.new
      book.name = v[:name]
      book.display_name = v[:name]
      book.author = Author.find_or_create_by!(name: v[:author] || '未知')
      book.category = Category.find_or_create_by!(name: category)
      book.tag = v[:tag]
      book.path = BOOK_PATH_PREFIX + category + '/' + book.name + '.txt'
      book.save!
      puts "....create book: #{v[:name]}".green
    end
  end

  desc "init the books"
  task init: :environment do

    flag1 = system "rake elasticsearch:create_index class=book"

    # 如果数据存在，同步数据到es
    #system "rake elasticsearch:rake elasticsearch:sync_data  class=book"

    if flag1
      Book.destroy_all

      init_book_list('修真')
      init_book_list('中华奇书')
      init_book_list('卫斯理')
      init_book_list('男主玄幻')
      init_book_list('男主网游')
      init_book_list('男主穿越')
      init_book_list('女主玄幻')
      init_book_list('女主网游')
      init_book_list('女主穿越')
      init_book_list('魔兽世界')
      init_book_list('魔法')

      Book.all.each do |book|
        book.pre_content = get_pre_content(book.path)
        book.save!
      end
    end

  end

  # rake book:rename path=/Users/crystal/Documents/books/小说/0510/ss
  desc "rename file in the spec dir"
  task rename: :environment do
    dir_path = ENV["path"]
    unless dir_path.present?
      puts "请指定路径:  rake book:encode path=/home/xiaopang/xxx".red
      next
    end
    begin
      FileUtils.cd(dir_path) do
        files = Dir.glob("*.[tT][xX][tT]")
        name_length = files.size.to_s.size
        count = 0
        files.each do |old_name|
          count += 1
          new_name = "#{count}".rjust(name_length, "0") + ".txt"
          File.rename(old_name, new_name)
          puts new_name.green
        end
        puts "-----------#{count}---"
      end
    end
  end

  # rake book:encode path=/Users/crystal/Documents/books/小说/0510/ss
  desc "change book encoding"
  task encode: :environment do
    # options = {}
    #
    # o = OptionParser.new
    # o.banner = "Usage: rake book:encode -- [options]"
    # o.on("-p PATH", "--path PATH","The absolute path you want use") { |path|
    #   options[:path] = path
    # }
    # o.on("-r", "--rename","Rename files") {
    #   options[:rename] = true
    # }
    # args = o.order!(ARGV) {}
    # o.parse!(args)
    #
    # puts options
    # exit

    dir_path = ENV["path"]
    rename = ENV["rename"]

    unless dir_path.present?
      puts "请指定路径:  rake book:encode path=/home/xiaopang/xxx".red
      next
    end
    begin
      FileUtils.cd(dir_path) do
        puts "current dir: #{FileUtils.pwd}".green
        convert_book_encoding
      end
    rescue Errno::ENOENT
      puts "无效的路径: #{ARGV[1]}".red
    rescue => e
      puts e.message.red
    end
  end

  desc "concat files to one file"
  task concat: :environment do
    dir_path = ENV["path"]
    unless dir_path.present?
      puts "请指定路径:  rake book:concat path=/home/xiaopang/xxx".red
      next
    end
    begin
      FileUtils.cd(dir_path) do
        puts "current dir: #{FileUtils.pwd}".green
        FileUtils.rm_rf('backup')
        sleep 2
        FileUtils.mkdir_p('backup')
        file_name = '1.txt'
        begin
          io = File.open("backup/#{file_name}", 'w')
          concat_files(io)
        rescue => e
          puts e.message.red
        ensure
          io.close
        end
      end
    rescue Errno::ENOENT
      puts "无效的路径: #{ARGV[1]}".red
    rescue => e
      puts e.message.red
    end
  end

  # 将目录下的所有txt文件，按名字排序后，合并成一个文件
  def concat_files(io)
    files = Dir.glob("*.[tT][xX][tT]").sort
    files.each do |file_name|
      puts file_name.green
      File.open(file_name) do |input|
        io.puts input.read
      end
    end
  end

  # 将目录下的所有txt文件，全部遍历，转码成utf8，并生成一份新的utf8编码的文件
  def convert_book_encoding
    error_files = []
    count = 0
    FileUtils.rm_rf('backup')
    sleep 2
    files = Dir.glob("**/*.[tT][xX][tT]")
    files.each do |file_name|
      count += 1
      dirname = File.dirname("backup/#{file_name}")
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

      begin
        next if File.zero?(file_name)
        File.open(file_name) do |input|
          content = input.read

          # 如果编码错乱，需要转成utf-8后，再copy
          if content.force_encoding('GB18030').valid_encoding?
            File.open("backup/#{file_name}", 'w') do |output|
              output.write(content.encode('UTF-8'))
            end
          end

          # 如果文件编码本身就是utf-8，则copy一份即可
          if content.force_encoding('UTF-8').valid_encoding?
            File.open("backup/#{file_name}", 'w') do |output|
              output.write(content)
            end
          end

        end
        puts "converting: #{file_name}".green
      rescue
        error_files << file_name
        # remove this error file
        # File.unlink(file_name)
        puts "----无法解析文件编码，请手动转码-----------#{file_name}----------------".red
      end
    end
    puts "........共计#{count}本"
  end

  # 验证转码后的文件是否正确转成了utf8
  def verify
    count = 0
    error_valid_files = []
    Dir.glob(["backup/**/*.txt", "backup/**/*.TXT"]).each do |file_name|
      count += 1
      File.open(file_name) do |io|
        str = ''
        10.times do
          str += (io.gets || '')
        end
        str = str.gsub(/(\s|[-=━])+/, "")[0, 30]

        if str.to_s =~ /(\p{Han}|[A-Za-z0-9])+/
          puts "----#{count.to_s}---验证通过-----------#{file_name}----#{str}------------".green
        else
          error_msg = "----#{count.to_s}---验证失败-----------#{file_name}----#{str}------------".red
          error_valid_files << error_msg
          puts error_msg
        end
      end
    end
    error_valid_files.each(&method(:puts))
    puts "........共计#{count}本"
  end

end
