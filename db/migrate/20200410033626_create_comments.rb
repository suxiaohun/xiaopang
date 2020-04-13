class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :created_by, :default => '佚名'

      t.timestamps
    end
  end
end
