namespace :tool do
  desc "初始化号码归属地数据"
  task init_phone_info: :environment do

    std_provinces_hash = { "110000" => "北京",
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
                           "820000" => "澳门" }
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

  desc "change number"
  task convert_number: :environment do
    #function getChineseCurrencyString(sAmount) {
    #             var value = sAmount;
    #
    #             if (value <= 0) return value;
    #             value = Math.abs(value);
    #             var sCN_Num = new Array("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖");
    #             var unit = new Array('元', '万', '亿', '万');
    #             var subunit = new Array('拾', '佰', '仟');
    #             var sCNzero = '零';
    #             var result = "";
    #             value = value.toString();
    #             var iDotIndex = value.indexOf('.');
    #             if (iDotIndex == -1) {
    #                 //var sBeforeDot = value.slice(0, iDotIndex);
    #                 var sBeforeDot = value;
    #                 var sAfterDot = 0;
    #             }
    #             else {
    #                 var sBeforeDot = value.slice(0, iDotIndex);
    #                 var sAfterDot = value.slice(iDotIndex);
    #             }
    #             var len = 0;
    #             //before dot
    #             len = sBeforeDot.length;
    #             var i = 0, j = 0, k = 0; //j is use to subunit,k is use to unit
    #             var oldC = '3';
    #             var cc = '0';
    #             result = unit[0] + result;
    #             var oldHasN = false;
    #             var hasN = false;
    #             var allZero = true;
    #
    #             for (i = 0; i < len; i++) {
    #                 if (j == 0 && i != 0) {
    #                     if (!hasN) {
    #                         if ((k % 2) == 0) result = result.slice(1);
    #                     }
    #                     else {
    #                         if (oldC == '0') result = sCNzero + result;
    #                     }
    #                     result = unit[k] + result;
    #                     //oldC = '3';
    #                     oldHasN = hasN;
    #                     hasN = false;
    #                 }
    #                 cc = sBeforeDot.charAt(len - i - 1);
    #                 if (oldC == '0' && cc != oldC) {
    #                     if (hasN) result = sCNzero + result;
    #                 }
    #                 if (cc != '0') {
    #                     if (j != 0)
    #                         result = subunit[j - 1] + result;
    #                     var dig = '0';
    #                     dig = sCN_Num[cc];
    #                     if (dig == '0')
    #                         return false;
    #                     hasN = true;
    #                     allZero = false;
    #                     result = dig + result;
    #                 }
    #                 oldC = cc;
    #                 j++;
    #                 if (j == 4) {
    #                     k++;
    #                     j = 0;
    #                 }
    #             }
    #             if (allZero) {
    #                 result = "零元";
    #             }
    #             else {
    #                 var bb = 0;
    #                 if (!hasN) {
    #                     bb++;
    #                     if (!oldHasN) {
    #                         bb++;
    #                     }
    #                 }
    #                 if (bb != 0)
    #                     result = result.slice(bb);
    #                 if (result.charAt(0) == '零')
    #                     result = result.slice(1);
    #             }
    #             //after dot
    #             if (sAfterDot = '0')
    #             { result += '整'; }
    #             else
    #             {
    #             sAfterDot = sAfterDot.slice(1);
    #             len = sAfterDot.length;
    #             var corn = new Array('0', '0');
    #             var cornunit = new Array('角', '分');
    #             var n = 0; //j is use to subunit,k is use to unit
    #             var dig = '0';
    #             corn[0] = sAfterDot.charAt(0);
    #             if (len > 1)
    #                 corn[1] = sAfterDot.charAt(1);
    #             else
    #                 corn[1] = '0';
    #             if ((corn[0] == '0') && (corn[1] == '0'))
    #                 return result += '整';
    #             else
    #                 if (allZero) result = "";
    #             for (i = 0; i < 2; i++) {
    #                 var curchar = corn[i];
    #                 dig = sCN_Num[curchar];
    #                 if (i == 0) {
    #                     if (result != "" || curchar != '0')
    #                         result += dig;
    #                     if (curchar != '0') {
    #                         result += cornunit[0];
    #                     }
    #                 }
    #                 }
    #                 if (i == 1 && curchar != '0') result = result + dig + cornunit[1];
    #             }
    #             return result;
    #         }
    number = ENV["path"]
    unless number.present?
      puts "请输入要转化的数字:  rake book:encode number=1234".red
      next
    end
    number = number.to_i
    if number < 0
      puts "invalid number"
      next
    end

    num = %w[零 壹 贰 叁 肆 伍 陆 柒 捌 玖]
    unit = %w[元 万 亿 万]
    subunit = %w[拾 佰 仟]




  end

end

YI = 10^8
QIANWAN = 10^7
BAIWAN= 10^6
SHIWAN = 10^5
WAN = 10^4

NUM_HASH = {
  '零':0,
  '壹':1,
  '贰':2,
  '叁':3,
  '肆':4,
  '伍':5,
  '陆':6,
  '柒':7,
  '捌':8,
  '玖':9
}


def convert_number number,result=""
  if number > Yi
    result = NUM_HASH.key(number/YI)+"亿"
    convert_number(number/10,result)
  elsif number>QIANWAN
    

  end
end
