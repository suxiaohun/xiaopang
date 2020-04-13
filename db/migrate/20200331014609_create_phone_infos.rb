class CreatePhoneInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_infos do |t|
      t.string :mobile_number
      t.string :mobile_area
      t.string :mobile_type
      t.string :area_code
      t.string :province_name
      t.string :province_code
      t.string :city_name
      t.string :city_code

      t.timestamps
    end
    add_index :phone_infos, :mobile_number
  end
end
