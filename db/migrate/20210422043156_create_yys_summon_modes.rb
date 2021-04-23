class CreateYysSummonModes < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_summon_modes do |t|

      t.string :code
      t.string :name
      t.timestamps
    end
  end
end
