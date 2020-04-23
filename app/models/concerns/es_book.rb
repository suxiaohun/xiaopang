module EsBook
  extend ActiveSupport::Concern

  included do
    self.__elasticsearch__.client = ES_BOOK_CLIENT

    after_commit :update_es_index_async, on: [:create, :update]
    # 注意：destroy之后，对象仅存在于内存中，无法再次获取（不太适用于异步调用）
    # es数据不存在，task会报错，先暂时注释掉
    #after_commit :destroy_index, on: [:destroy]


    settings index: {number_of_shards: 1} do
      mapping dynamic: false do
        indexes :id, type: :integer
        indexes :name, type: :keyword
        indexes :category, type: :keyword
        indexes :created_at, type: :keyword
      end
    end
  end

  def as_indexed_json(options = {})
    db_columns = []
    db_columns << :id
    db_columns << :name
    db_columns << :created_at

    hash = as_json(only: db_columns, methods: [])
    hash.merge extra_fields_for_es
  end

  def extra_fields_for_es
    {
        category: category.name
    }
  end


  def update_index
    __elasticsearch__.index_document
  end

  def destroy_index
    __elasticsearch__.delete_document
  end

  def update_es_index_async
    EsUpdateBookJob.perform_later self.id
  end

end