class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, :default => ''
      t.string :display_name, :default => ''
      t.integer :author_id
      t.integer :category_id
      t.string :tag, :default => '' # 一本书可能会有多种tag（仅用来排序和检索），但仍然只属于一种category
      t.string :desc, :default => '...'
      t.string :path
      t.string :remark
      t.text :pre_content # 预展示内容，一般展示书籍前10行

      t.timestamps
    end
  end
end
