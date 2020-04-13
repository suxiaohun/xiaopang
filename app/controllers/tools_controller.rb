class ToolsController < ApplicationController

  def json_format

  end

  def colors

  end

  def mobile_area
  end

  def get_mobile_area
    mobile_number = params[:mobile_number].to_s.gsub(/[^0-9]/, '')
    mobile_number = mobile_number[0, 7]
    @mobile_area = '无记录'
    @mobile_number = mobile_number
    if mobile_number.size >= 7
      type, area_code = check_mobile_number(mobile_number)
      if type == 'Mobile'
        phone_info = PhoneInfo.find_by mobile_number: mobile_number
      elsif type == 'Fixed Line'
        phone_info = PhoneInfo.find_by(area_code: area_code) if area_code
      end
      if phone_info
        @mobile_area = phone_info.try(:mobile_area)
        @mobile_number = phone_info.try(:mobile_number)
      end
    else
      @mobile_area = '至少输入7位数字'
    end
    puts "#{@mobile_number} #{@mobile_area}"
  end

  def comment_save
    @comment = Comment.new(comment_params)
    @comment.created_by = cookies[:nick_name]
    @comment.save
  end

  private

  def check_mobile_number(number)
    case number
    when /^0[12]/
      return 'Fixed Line', number[0, 3]
    when /^0[3-9]/
      return 'Fixed Line', number[0, 4]
    when /^852/
      return 'Fixed Line', '852'
    when /^853/
      return 'Fixed Line', '852'
    when /^886/
      return 'Fixed Line', '852'
    when /^1/
      'Mobile'
    else
      'UNKNOWN'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:content)
  end

end
