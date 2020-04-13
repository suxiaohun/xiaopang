class CreateYysUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_users do |t|
      t.string :ip
      t.string :name
      t.integer :seq, default: 1 # 序列，用来判定

      t.timestamps
    end
  end
end
