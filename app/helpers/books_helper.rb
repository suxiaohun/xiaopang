module BooksHelper
  def category_list
    category_ids = Book.pluck(:category_id).uniq
    @categories = Category.find(category_ids)
  end

end
