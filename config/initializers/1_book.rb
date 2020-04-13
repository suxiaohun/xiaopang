BOOK_DEFAULT_LINES = 20
if Rails.env.development?
  BOOK_PATH_PREFIX = 'public/txt/'
else
  BOOK_PATH_PREFIX = 'public/books/'
end

