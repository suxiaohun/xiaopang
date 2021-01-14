class BooksController < ApplicationController
  before_action :set_book, only: [:show, :page_size, :next, :goto, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    ids = Book.pluck(:id)
    @books = Book.find(ids.sample(10))
  end

  def category
    if params[:id] == 'all'
      @books = Book.includes(:author).all
    else
      @books = Book.includes(:author).where(category_id: params[:id])
    end
  end


  # GET /books/1
  # GET /books/1.json
  def show
    @data = {}
    @data[:id] = params[:id]
    File.open(@book.path) do |io|
      @data[:pre_pos] = io.pos
      @data[:curr_pos] = io.pos
      @data[:lines] = io.first(get_page_size)
      @data[:next_pos] = io.pos
    end
  end


  def page_size
    page_size = params[:page_size].to_i

    unless page_size >= 5 && page_size <= 100
      page_size = BOOK_DEFAULT_LINES
    end
    cookies[:page_size] = page_size

    current_pos = params[:current_pos].to_i

    @data = {}
    @data[:id] = params[:id]
    File.open(@book.path) do |io|
      io.pos = current_pos.to_i
      @data[:curr_pos] = current_pos
      @data[:lines] = io.first(get_page_size)
      @data[:next_pos] = io.pos
    end

  end

  def goto
    process = params[:process].to_i

    unless process >= 0 && process <= 100
      process = 0
    end
    _pos = get_book_redis_key("#{@book.name}-#{process}")

    @data = {}
    @data[:id] = params[:id]
    File.open(@book.path) do |io|
      io.pos = _pos.to_i
      @data[:curr_pos] = io.pos
      @data[:lines] = io.first(get_page_size)
      @data[:next_pos] = io.pos
    end
  end

  def next
    @data = {}
    @data[:id] = params[:id]
    File.open(@book.path) do |io|
      io.pos = (params[:next_pos].to_i || 0)
      @data[:curr_pos] = io.pos
      @data[:lines] = io.first(get_page_size)
      @data[:next_pos] = io.pos
    end

    total_pos = get_book_redis_key("#{@book.name}-total").to_i
    @data[:rate] = (@data[:curr_pos] * 100.0 / total_pos).round(2)

    puts ".....#{@data[:rate]}"
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def es
    @books = Book.all.page(params[:page] || 1)
    #render layout: 'es'
  end

  def es_search
    es_query = {}

    es_query[:from] = 0
    es_query[:size] = 1000 # es默认是10条
    es_query[:query] = {"match_all": {}}

    if params[:name].present?
      es_query[:query] = {
          wildcard: {
              name: '*' + params[:name] + "*"
          }
      }
    end

    es_query[:sort] = [
        {"created_at": {"order": "desc"}}
    ]

    logs = Book.__elasticsearch__.search(es_query)
    @books = logs.records.page(params[:page] || 1)
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.fetch(:book, {})
  end

  def get_page_size
    page_size = cookies[:page_size] || BOOK_DEFAULT_LINES
    page_size.to_i
  end

  # 使用redis缓存book的行数\位置信息
  def get_book_redis_key(key)
    unless BOOK_REDIS.get(key)
      _pos_hash = {}
      _pos_hash[0] = 0

      File.open(@book.path) do |io|
        _temp_hash = {}
        count = 0
        io.each_line do
          count += 1
          _temp_hash[count] = io.pos
        end
        # 文件pos指针,用来计算进度条
        BOOK_REDIS.set("#{@book.name}-total", _temp_hash[count])

        _op = count / 100
        100.times do |i|
          BOOK_REDIS.set("#{@book.name}-#{0}", 0) if i == 0
          i += 1
          BOOK_REDIS.set("#{@book.name}-#{i}", _temp_hash[_op * i])
        end
      end
    end
    BOOK_REDIS.get(key)
  end
end
