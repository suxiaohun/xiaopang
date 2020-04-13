class CreateYysRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_regions do |t|
      t.string :key # 大区pinyin-标识，防止每次重建导致匹配失败
      t.string :name
      t.string :mode # 全平台、双平台、安卓、ios

      t.timestamps
    end
  end
end
