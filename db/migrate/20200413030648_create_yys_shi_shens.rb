class CreateYysShiShens < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_shi_shens do |t|
      t.string :sid
      t.string :name
      t.string :name_sp, comment: 'sp皮肤name'
      t.string :kind, default: 'SSR', comment: 'SSR或SP'
      t.string :form, default: 'ORIGIN', comment: '原生（ORIGIN）/联动（LINKAGE），联动式神不参与抽卡游戏'
      t.boolean :cartoon, default: false, comment: '是否有召唤动画'
      t.boolean :cartoon_sp, default: false, comment: '是否有sp召唤动画'

      t.timestamps
    end
  end
end
