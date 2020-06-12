class CreateYysSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :yys_skills do |t|
      t.string :sid
      t.string :skill_id
      t.string :skill_name
      t.string :skill_mode
      t.string :skill_kind
      t.string :skill_damage
      t.boolean :extra

      t.timestamps
    end
  end
end
