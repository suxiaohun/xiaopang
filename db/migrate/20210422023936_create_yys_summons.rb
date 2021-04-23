class CreateYysSummons < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_summons do |t|
      t.string :mode_id
      t.string :sid
      t.integer :up_count

      t.timestamps
    end
  end
end
