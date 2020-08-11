namespace :book do
  def get_pre_content(path)
    pre_content = '......'
    begin
      File.open(path) do |io|
        pre_content = io.gets.chomp
        10.times { |x| pre_content += io.gets.chomp }
      end
      puts "....init book preview content: #{path}".green
    rescue => e
      puts "#{e.message}".red
    end
    pre_content
  end

  desc "init the books"
  task init: :environment do

    flag1 = system "rake elasticsearch:create_index class=book"

    # 如果数据存在，同步数据到es
    #system "rake elasticsearch:rake elasticsearch:sync_data  class=book"

    if flag1
      Book.destroy_all
      books = YAML.load_file('lib/utils/files/book1.yml').deep_symbolize_keys
      books.each do |k, v|
        book = Book.new
        book.name = v[:name]
        book.display_name = v[:name]
        book.author = Author.find_or_create_by!(name: v[:author])
        book.category = Category.find_or_create_by!(name: v[:category])
        book.tag = v[:tag]
        book.path = BOOK_PATH_PREFIX + book.name + '.txt'
        book.save!
        puts "....create book: #{v[:name]}".green
      end

      Book.all.each do |book|
        book.pre_content = get_pre_content(book.path)
        book.save!
      end
    end


  end
end
