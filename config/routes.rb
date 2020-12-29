Rails.application.routes.draw do

  get 'chat',to: 'chat_rooms#index'
  get 'compress',to: 'tools#compress'
  get 'sense',to: 'tools#sense'
  post 'sense_encode',to: 'tools#sense_encode'
  get 'test_timeout', to: 'common#test_timeout'
  get 'test', to: 'common#test'

  get 'skills', to: 'common#skills'
  get 'items', to: 'common#items'
  get 'groups', to: 'common#groups'


  match 'fates/auth', to: 'fates#auth', :via => [:get, :post]

  resources :fates
  get 'yys',to: 'yys#index'

  get 'test',to: "yys#test"

  post 'yys/update_info',to: 'yys#update_info'
  get 'yys/guess',to: 'yys#guess'
  get 'yys/simulate',to: 'yys#simulate'
  match 'yys/auth', to: 'yys#auth', :via => [:get, :post]
  get 'yys/rate', to: 'yys#rate'
  post 'yys/summon', to: 'yys#summon'



  get 'books/category/:id', to: 'books#category'
  get 'books/next/:next_pos/:id', to: 'books#next'
  get 'books/goto', to: 'books#goto'
  get 'books/page_size', to: 'books#page_size'
  get 'books/es', to: 'books#es'
  get 'books/es_search', to: 'books#es_search'

  resources :books

  get 'colors',to: 'tools#colors'

  get 'unicode', to: 'tools#unicode'
  get 'json_format', to: 'tools#json_format'
  get 'mobile_area', to: 'tools#mobile_area'
  get 'get_mobile_area', to: 'tools#get_mobile_area'
  post 'comment_save', to: 'tools#comment_save'




  root 'common#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
