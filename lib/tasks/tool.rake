namespace :tool do
  desc "初始化号码归属地数据"
  task init_phone_info: :environment do

    std_provinces_hash = {"110000" => "北京",
                          "120000" => "天津",
                          "130000" => "河北",
                          "140000" => "山西",
                          "150000" => "内蒙古",
                          "210000" => "辽宁",
                          "220000" => "吉林",
                          "230000" => "黑龙江",
                          "310000" => "上海",
                          "320000" => "江苏",
                          "330000" => "浙江",
                          "340000" => "安徽",
                          "350000" => "福建",
                          "360000" => "江西",
                          "370000" => "山东",
                          "410000" => "河南",
                          "420000" => "湖北",
                          "430000" => "湖南",
                          "440000" => "广东",
                          "450000" => "广西",
                          "460000" => "海南",
                          "500000" => "重庆",
                          "510000" => "四川",
                          "520000" => "贵州",
                          "530000" => "云南",
                          "540000" => "西藏",
                          "610000" => "陕西",
                          "620000" => "甘肃",
                          "630000" => "青海",
                          "640000" => "宁夏",
                          "650000" => "新疆",
                          "710000" => "台湾",
                          "810000" => "香港",
                          "820000" => "澳门"}
    PhoneInfo.delete_all

    count = 0
    File.open("#{Rails.root.to_s}/lib/utils/files/phone_info.txt").each_line do |line|
      count += 1
      _arr = line.split
      phone_info = PhoneInfo.new
      phone_info.mobile_number = _arr[0]
      phone_info.province_name = _arr[1]
      phone_info.province_code = std_provinces_hash.key _arr[1]
      phone_info.city_name = _arr[2]
      phone_info.mobile_area = "#{_arr[1]} #{_arr[2]}"
      phone_info.save!
      puts "....#{count}....#{_arr}"
    end

  end

end
