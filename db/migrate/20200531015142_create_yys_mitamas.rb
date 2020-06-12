class CreateYysMitamas < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_mitamas do |t|
      t.string :mid
      t.string :name
      t.string :remark


      t.timestamps
    end
  end
end
