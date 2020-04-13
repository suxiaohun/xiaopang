class CreateYysAtlas < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_atlas do |t|
      t.string :nick_name
      t.text :sids

      t.timestamps
    end
  end
end
