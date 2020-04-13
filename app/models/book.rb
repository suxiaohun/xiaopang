class Book < ApplicationRecord
  include Elasticsearch::Model
  include EsBook

  belongs_to :author
  belongs_to :category

end
