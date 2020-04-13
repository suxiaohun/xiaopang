class EsUpdateBookJob < ApplicationJob
  queue_as :default

  def perform(book_id)
    book = Book.find book_id
    book.update_index
  end
end
