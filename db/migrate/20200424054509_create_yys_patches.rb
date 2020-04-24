class CreateYysPatches < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_patches do |t|
      t.string :title
      t.string :content
      t.string :version

      t.timestamps
    end
  end
end
