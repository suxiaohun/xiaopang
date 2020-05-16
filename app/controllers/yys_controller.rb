class YysController < ApplicationController
  before_action :require_auth, :except => [:auth, :all_cookies]


  def index
    config = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../../../config/yys/yys.yml', __FILE__)))).deep_symbolize_keys
    @max_count = config[:max_pick_count] || 1000
  end


  def summon
    number = params[:number].to_i
    number = 2000 if number > 2000
    mode = params[:mode] ? true : false
    spec_up = params[:hd]

    @show_cartoon = params[:cartoon] ? true : false

    if spec_up == 'SP'
      up_count = 3
      @result, @summon_count = summon_sp(number, mode, up_count)
    elsif spec_up == 'SSR'
      up_count = 3
      @result, @summon_count = summon_ssr(number, mode, up_count)
    elsif spec_up == 'SJ'
      up_count = 3
      @result, @summon_count = summon_sj(number, mode, up_count)
    else
      up_count = 0
      summon_common(number, up_count)
    end
  end

  def summon_common(number, up_count)
    ssrs = YysShiShen.where(kind: 'SSR', form: 'origin')
    sps = YysShiShen.where(kind: 'SP', form: 'origin')

    result = {}

    number.times do |num|
      seed1 = rand * 100
      if up_count > 0
        pick_rate = 1.25 * (1 + 2.5)
      else
        pick_rate = 1.25
      end
      if seed1 < pick_rate
        if up_count > 0
          up_count -= 1
        end

        if seed1 < (pick_rate / 1.25) # ssr
          ss = ssrs[rand ssrs.size]
        else # sp
          ss = sps[rand(sps.size)]
        end
        result[num + 1] = {}
        result[num + 1][:sid] = ss.sid
        result[num + 1][:name] = ss.name
        result[num + 1][:name_sp] = ss.name_sp
        result[num + 1][:cartoon] = ss.cartoon
        result[num + 1][:cartoon_sp] = ss.cartoon_sp
      end
    end

    # 同时判定是否sp版本
    result.each do |k, v|
      if Rails.env.production? && v[:cartoon]
        _seed_sp = rand(100)
        if _seed_sp < 10
          if v[:cartoon_sp]
            v[:name] = "<span style='color:purple;font-weight:bolder;font-size:20px;'>" + v[:name] + '·' + v[:name_sp] + '</span>'
            _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}-1.mp4")
          end
        end
        _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}.mp4") unless _v_path
        # 暂时统一替换为sp动画
        v[:video_path] = _v_path
      end
    end

    set_total_count
    summon_count = {}
    summon_count[:total_count] = RATE_REDIS.llen('total_count')
    return result, summon_count

  end

  def summon_ssr(number, mode, up_count)

    ssrs = YysShiShen.where(kind: 'SSR', form: 'origin').where.not(sid: SPEC_SID)
    sps = YysShiShen.where(kind: 'SP', form: 'origin')

    result = {}
    spec_flag = true
    spec_ss = YysShiShen.find_by sid: SPEC_SID

    number.times do |num|
      if spec_flag && mode && num == 699
        result[num + 1] = {}
        result[num + 1][:sid] = spec_ss.sid
        result[num + 1][:name] = "<span style='color:#111de0;font-weight:bold;'>#{spec_ss.name}（700保底）</span>"
        result[num + 1][:name_sp] = spec_ss.name_sp
        result[num + 1][:cartoon] = spec_ss.cartoon
        result[num + 1][:cartoon_sp] = spec_ss.cartoon_sp
        spec_flag = false
        next
      end

      spec_rate = get_spec_rate(num, 'SSR', mode)

      seed1 = rand * 100
      if up_count > 0
        pick_rate = 1.25 * (1 + 2.5)
      else
        pick_rate = 1.25
      end
      if seed1 < pick_rate
        if up_count > 0
          up_count -= 1
        end

        if spec_flag
          spec_seed = rand(100)
          if spec_seed < spec_rate
            spec_flag = false
            result[num + 1] = {}
            result[num + 1][:sid] = spec_ss.sid
            result[num + 1][:name] = "<span style='color:#{spec_ss.show_color};font-weight:bold;'>#{spec_ss.name}（#{spec_rate}%）</span>"
            result[num + 1][:name_sp] = spec_ss.name_sp
            result[num + 1][:cartoon] = spec_ss.cartoon
            result[num + 1][:cartoon_sp] = spec_ss.cartoon_sp
            next
          end
        end

        if seed1 < (pick_rate / 1.25) # ssr
          ss = ssrs[rand ssrs.size]
        else # sp
          ss = sps[rand(sps.size)]
        end
        result[num + 1] = {}
        result[num + 1][:sid] = ss.sid
        result[num + 1][:name] = ss.name
        result[num + 1][:name_sp] = ss.name_sp
        result[num + 1][:cartoon] = ss.cartoon
        result[num + 1][:cartoon_sp] = ss.cartoon_sp
      end

      if num == 519
        result[num + 1] ||= {}
        result[num + 1][:name] ||= ''
        result[num + 1][:name] = result[num + 1][:name] + "<span style='color:#111de0;font-weight:bold;'>【月之符咒】</span>"
      end
    end

    # 同时判定是否sp版本
    result.each do |k, v|
      if Rails.env.production? && v[:cartoon]
        _seed_sp = rand(100)
        if _seed_sp < 10
          if v[:cartoon_sp]
            v[:name] = "<span style='color:purple;font-weight:bolder;font-size:20px;'>" + v[:name] + '·' + v[:name_sp] + '</span>'
            _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}-1.mp4")
          end
        end
        _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}.mp4") unless _v_path
        # 暂时统一替换为sp动画
        v[:video_path] = _v_path
      end
    end


    set_total_count
    summon_count = {}
    summon_count[:total_count] = RATE_REDIS.llen('total_count')
    return result, summon_count
  end

  def summon_sp(number, mode, up_count)
    ssrs = YysShiShen.where(kind: 'SSR', form: 'origin')
    sps = YysShiShen.where(kind: 'SP', form: 'origin').where.not(sid: SPEC_SID)

    result = {}
    spec_flag = true
    spec_ss = YysShiShen.find_by sid: SPEC_SID

    number.times do |num|
      if spec_flag && mode && num == 699
        result[num + 1] = {}
        result[num + 1][:sid] = spec_ss.sid
        result[num + 1][:name] = "<span style='color:#111de0;font-weight:bold;'>#{spec_ss.name}（700保底）</span>"
        result[num + 1][:name_sp] = spec_ss.name_sp
        result[num + 1][:cartoon] = spec_ss.cartoon
        result[num + 1][:cartoon_sp] = spec_ss.cartoon_sp
        spec_flag = false
        next
      end

      spec_rate = get_spec_rate(num, 'SP', mode)

      seed1 = rand * 100
      if up_count > 0
        pick_rate = 1.25 * (1 + 2.5)
      else
        pick_rate = 1.25
      end
      if seed1 < pick_rate
        if up_count > 0
          up_count -= 1
        end

        if spec_flag
          spec_seed = rand(100)
          if spec_seed < spec_rate
            spec_flag = false
            result[num + 1] = {}
            result[num + 1][:sid] = spec_ss.sid
            result[num + 1][:name] = "<span style='color:#{spec_ss.show_color};font-weight:bold;'>#{spec_ss.name}（#{spec_rate}%）</span>"
            result[num + 1][:name_sp] = spec_ss.name_sp
            result[num + 1][:cartoon] = spec_ss.cartoon
            result[num + 1][:cartoon_sp] = spec_ss.cartoon_sp
            next
          end
        end

        if seed1 < (pick_rate / 1.25) # ssr
          ss = ssrs[rand ssrs.size]
        else # sp
          ss = sps[rand(sps.size)]
        end
        result[num + 1] = {}
        result[num + 1][:sid] = ss.sid
        result[num + 1][:name] = ss.name
        result[num + 1][:name_sp] = ss.name_sp
        result[num + 1][:cartoon] = ss.cartoon
        result[num + 1][:cartoon_sp] = ss.cartoon_sp
      end
    end

    # 同时判定是否sp版本
    result.each do |k, v|
      if Rails.env.production? && v[:cartoon]
        _seed_sp = rand(100)
        if _seed_sp < 10
          if v[:cartoon_sp]
            v[:name] = "<span style='color:purple;font-weight:bolder;font-size:20px;'>" + v[:name] + '·' + v[:name_sp] + '</span>'
            _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}-1.mp4")
          end
        end
        _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}.mp4") unless _v_path
        # 暂时统一替换为sp动画
        v[:video_path] = _v_path
      end
    end

    set_total_count
    summon_count = {}
    summon_count[:total_count] = RATE_REDIS.llen('total_count')
    return result, summon_count
  end

  def summon_sj(number, mode, up_count)
    mode = false
    wei_shou_lu = true
    shen_juan = true

    wei_shou_lu_sss = ShiShen.where(kind: 'origin').pluck(:sid) - (Card.find_by(nick_name: cookies[:nick_name]).try(:sids) || [])

    # sp不计入全图福利
    mode_ssrs = ShiShen.where(kind: 'origin', mode: 'SSR').pluck(:sid) - (Card.find_by(nick_name: cookies[:nick_name]).try(:sids) || [])
    mode = true if mode_ssrs.count == 1

    ssrs = ShiShen.where(mode: 'SSR', kind: 'origin')
    sps = ShiShen.where(mode: 'SP', kind: 'origin')

    result = {}

    number.times do |num|
      # 全图700抽获取神眷符咒
      if shen_juan
        if mode && num == 699
          result[:sj] = {}
          result[:sj][:count] = 700
          result[:sj][:color] = 'rgb(232,112,30)'
          result[:sj][:name] = "<span style='color:#111de0;font-weight:bold;'> 神眷(700抽保底)</span>"
          result[:sj][:name_sp] = ''
          result[:sj][:cartoon] = false
          result[:sj][:cartoon_sp] = false
          shen_juan = false
        end
      end

      seed1 = rand * 100
      if up_count > 0
        pick_rate = 1.25 * (1 + 2.5)
      else
        pick_rate = 1.25
      end
      if seed1 < pick_rate
        if up_count > 0
          up_count -= 1
        end
        # wsl
        if wei_shou_lu
          wsl_sid = wei_shou_lu_sss[rand(wei_shou_lu_sss.size)]
          wsl_ss = ShiShen.find_by sid: wsl_sid
          wsl_ss.color = 'rgb(232,112,30)'
          result[num + 1] = {}
          result[num + 1][:sid] = wsl_ss.sid
          result[num + 1][:name] = "<span style='color:#{wsl_ss.color};font-weight:bold;'>#{wsl_ss.name}（未收录）</span>"
          result[num + 1][:name_sp] = wsl_ss.name_sp
          result[num + 1][:cartoon] = wsl_ss.cartoon
          result[num + 1][:cartoon_sp] = wsl_ss.cartoon_sp
          wei_shou_lu = false

          # 未收录也要判定神眷
          if shen_juan
            # 神眷与sp共用同样的概率up
            spec_rate = get_spec_rate(num, 'SP', mode)
            spec_seed = rand(100)
            if spec_seed < spec_rate
              result[num + 1][:name] = "<span style='color:#{wsl_ss.color};font-weight:bold;'>#{wsl_ss.name}</span><span style='color:#007bff;font-weight:bold;'> 未收录+神眷(#{spec_rate}%)</span>"
              shen_juan = false
            end
          end
          next
        end

        if seed1 < (pick_rate / 1.25) # ssr
          ss = ssrs[rand ssrs.size]
        else # sp
          ss = sps[rand(sps.size)]
        end
        result[num + 1] = {}
        result[num + 1][:sid] = ss.sid
        result[num + 1][:name] = ss.name
        result[num + 1][:name_sp] = ss.name_sp
        result[num + 1][:cartoon] = ss.cartoon
        result[num + 1][:cartoon_sp] = ss.cartoon_sp

        # sj
        if shen_juan
          # 神眷与sp共用同样的概率up
          spec_rate = get_spec_rate(num, 'SP', mode)
          spec_seed = rand(100)
          if spec_seed < spec_rate
            result[num + 1][:name] += "<span style='color:#111de0;font-weight:bold;'> 神眷(#{spec_rate}%)</span>"
            shen_juan = false
          end
        end
      end
    end

    # 同时判定是否sp版本
    result.each do |k, v|
      if Rails.env.production? && v[:cartoon]
        _seed_sp = rand(100)
        if _seed_sp < 10
          if v[:cartoon_sp]
            v[:name] = "<span style='color:purple;font-weight:bolder;font-size:20px;'>" + v[:name] + '·' + v[:name_sp] + '</span>'
            _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}-1.mp4")
          end
        end
        _v_path = ActionController::Base.helpers.video_path("#{v[:sid]}.mp4") unless _v_path
        # 暂时统一替换为sp动画
        v[:video_path] = _v_path
      end
    end

    set_total_count
    summon_count = {}
    summon_count[:total_count] = RATE_REDIS.llen('total_count')
    return result, summon_count
  end


  def auth
    if request.post?

      region_name = YysRegion.where(key: params[:region]).first.try(:name) || 'UNKNOWN'
      cookies[:yys_nick_name] = {value: "#{region_name}-#{params[:name]}", expires: 30.days}
      flash[:yys_nick_name] = params[:name]

      # 将ip与nick_name绑定，如果已经存在，则忽略
      ip = request.remote_ip.to_s
      YysUser.find_or_create_by(name: cookies[:yys_nick_name], ip: ip)

      if params[:redirect_controller].present? && params[:redirect_action].present?
        redirect_to controller: params[:redirect_controller], action: params[:redirect_action]
      else
        redirect_to '/yys'
      end
    else
      cookies.delete :yys_nick_name
    end
  end

  private

  def set_total_count
    RATE_REDIS.rpush('total_count', 1)
  end


  def all_sp_rate(num)
    if num >= 500
      100
    elsif num >= 450
      80
    elsif num >= 400
      60
    elsif num >= 350
      45
    elsif num >= 300
      40
    elsif num >= 250
      35
    elsif num >= 200
      30
    elsif num >= 150
      25
    elsif num >= 100
      20
    elsif num >= 50
      15
    else
      10
    end
  end

  def all_ssr_rate(num)
    if num >= 500
      100
    elsif num >= 450
      90
    elsif num >= 400
      80
    elsif num >= 350
      60
    elsif num >= 300
      45
    elsif num >= 250
      40
    elsif num >= 200
      35
    elsif num >= 150
      30
    elsif num >= 100
      25
    elsif num >= 50
      20
    else
      15
    end
  end

  def single_sp_rate(num)
    if num >= 700
      25
    elsif num >= 500
      15
    elsif num >= 450
      14
    elsif num >= 400
      13
    elsif num >= 350
      12
    elsif num >= 300
      11
    elsif num >= 250
      10
    elsif num >= 200
      8
    elsif num >= 150
      6
    elsif num >= 100
      5
    elsif num >= 50
      4
    else
      3
    end
  end

  def single_ssr_rate(num)
    if num >= 700
      30
    elsif num >= 500
      20
    elsif num >= 450
      13
    elsif num >= 400
      12
    elsif num >= 350
      11
    elsif num >= 300
      10
    elsif num >= 250
      9
    elsif num >= 200
      8
    elsif num >= 150
      7
    elsif num >= 100
      6
    elsif num >= 50
      5
    else
      4
    end
  end


  def get_spec_rate(num, type, mode)
    # 全图、SP
    if mode && type == 'SP'
      return all_sp_rate(num)
    end
    # 全图、SSR
    if mode && type == 'SSR'
      return all_ssr_rate(num)
    end
    # 非全图、SP
    if !mode && type == 'SP'
      return single_sp_rate(num)
    end
    # 非全图、SSR
    if !mode && type == 'SSR'
      return single_ssr_rate(num)
    end
  end


  def require_auth

    if cookies[:yys_nick_name]
      region_name = cookies[:yys_nick_name].split('-')[0]
      exist_region = YysRegion.find_by(name: region_name)
      if exist_region
        true
      else
        cookies.delete :yys_nick_name
        redirect_to '/yys/auth'
      end
    else
      redirect_to "/yys/auth?redirect_controller=#{params[:controller]}&redirect_action=#{params[:action]}"
    end
  end


end
