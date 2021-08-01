class YysController < ApplicationController
  before_action :require_auth, :except => [:auth, :all_cookies]

  def index
    config = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../../../config/yys/yys.yml', __FILE__)))).deep_symbolize_keys
    @max_count = config[:max_pick_count] || 1000
  end

  def maintenance
    "
   Notes:

1. Sakura Coins can be used in the Tales Shop for Memory Shard, an item which can be used in the event. Piece together the Memory Shard on your scrapbooks to create a story and obtain rewards.

2. After collecting all Memory Shards, players can redeem other items from the event shop, including Youko's new skin can not be obtained by any other means before 2021, so do not miss out!

2. Spring Talisman Pass (April)

Event time: After the update on April 8th - May 13th EST.

Onmyoji can complete different missions to increase their Talisman level.

As the Talisman level increases, Onmyoji can obtain various rewards.

Purchase the Deluxe Talisman to unlock bonus rewards such as Shiranui's skin  Dancer

Note: The Talisman Pass 20% Off Voucher obtained from the Talisman Pass the last month will be automatically used when purchasing the Deluxe Talisman. This reduces the price for the Classic Chest and Premium Chests to 40 S-jade and 92 S-jade respectively.
"
  end


  def manage
    @summon = YysSummon.first
    @summon_modes = YysSummonMode.all
    ss1 = YysShiShen.sp.last(2)
    ss2 = YysShiShen.ssr.last(2)
    @shishens = ss1 + ss2
    @patch = YysPatch.last
  end

  def update_manage
    summon = YysSummon.first
    summon.mode_id = params[:mode_id]
    summon.sid = params[:sid]
    summon.up_count = params[:up_count]
    summon.save!
  end

  def add_ss
    ss = YysShiShen.new
    ss.sid = params[:sid]
    ss.name = params[:sname]
    ss.kind = params[:kind]
    ss.save!
  end

  def add_region
    ss = YysRegion.new
    ss.name = params[:name]
    ss.mode = params[:mode]
    ss.key = params[:key]
    ss.save!
  end

  def add_patch
    p = YysPatch.new
    p.version = params[:version]
    p.title = params[:title]
    p.content = params[:content]
    p.save!
  end

  def guess

  end

  def guess_info

  end

  def update_info

    red = []
    blue = []

    speed_arr = []

    attr = %i(damage  health armor speed crit_chance crit_damage hit resist)

    red_sids = params[:red].as_json.map { |k, v| v["sid"] }
    red_mids = params[:red].as_json.map { |k, v| v["mid"] }
    red_ahead_speed = ahead_attr('speed', red_sids)
    red_ahead_armor = ahead_attr('armor', red_sids)

    params[:red].as_json.deep_symbolize_keys.each do |k, v|
      speed_arr << v[:speed]
      v[:sname] = YysShiShen.find_by_sid(v[:sid]).try(:name)
      v[:mname] = YysMitama.find_by_mid(v[:mid]).try(:name)
      v[:kind] = 'red'
      v[:die] = false

      attr.each do |ar|
        v[ar] = v[ar].to_i
      end

      v[:damage_bound] = 0
      v[:speed_bound] = red_ahead_speed
      v[:armor_bound] = (v[:armor] * red_ahead_armor).to_i
      v[:max_health] = v[:health] * 2.4
      v[:curr_health] = v[:health] * 2.4
      v[:health_percent] = (v[:curr_health] * 1.0 / v[:max_health]).round(2)

      red << v
    end

    blue_sids = params[:blue].as_json.map { |k, v| v["sid"] }
    blue_mids = params[:blue].as_json.map { |k, v| v["mid"] }
    blue_ahead_speed = ahead_attr('speed', blue_sids)
    blue_ahead_armor = ahead_attr('armor', blue_sids)

    params[:blue].as_json.deep_symbolize_keys.each do |k, v|
      speed_arr << v[:speed]
      v[:sname] = YysShiShen.find_by_sid(v[:sid]).try(:name)
      v[:mname] = YysMitama.find_by_mid(v[:mid]).try(:name)
      v[:kind] = 'blue'
      v[:die] = false

      attr.each do |ar|
        v[ar] = v[ar].to_i
      end

      v[:damage_bound] = 0
      v[:speed_bound] = blue_ahead_speed
      v[:armor_bound] = (v[:armor] * blue_ahead_armor).to_i
      v[:max_health] = v[:health] * 2.4
      v[:curr_health] = v[:health] * 2.4
      v[:health_percent] = (v[:curr_health] * 1.0 / v[:max_health]).round(2)

      blue << v
    end

    YYS_REDIS.set('red', red.to_json)
    YYS_REDIS.set('blue', blue.to_json)
    YYS_REDIS.set('length', speed_arr.max.to_i)
    YYS_REDIS.set('red_resource', ahead_attr('resource', red_sids))
    YYS_REDIS.set('red_point', ahead_attr('point', red_sids, red_mids))
    YYS_REDIS.set('blue_resource', ahead_attr('resource', blue_sids))
    YYS_REDIS.set('blue_point', ahead_attr('point', red_sids, blue_mids))
  end

  def test

  end

  def simulate

    @red = JSON.parse(YYS_REDIS.get('red')).map { |x| x.deep_symbolize_keys }
    @blue = JSON.parse(YYS_REDIS.get('blue')).map { |x| x.deep_symbolize_keys }
    @result = {}

    all = @red + @blue

    max_len = YYS_REDIS.get('length').to_i

    all.each do |obj|
      _len = max_len - obj[:speed]
      _cost = _len * 1.00 / obj[:speed]
      obj[:cost] = _cost
      obj[:len] = obj[:speed]
    end

    100.times do |i|
      round_pick = all.sort_by { |v| v[:cost] }
      pick = round_pick.first
      pick_cost = pick[:cost]

      get_skill(pick)

      get_damage(pick)

      @result["round-#{i}"] = {}
      @result["round-#{i}"][:obj] = pick

      round_msg = []

      #if pick[1][:clear]
      #  blue.each do |kk,vv|
      #    if rand < 0.2
      #      clear_len = max_len*pick[1][:clear]
      #      vv[:len] = [vv[:len]-clear_len,0].max
      #      round_msg << "#{kk}被击退#{pick[1][:clear]*100}%行动条"
      #    end
      #  end
      #end

      # 下一个行动判定
      all.each do |v|
        actual_speed = v[:speed] + v[:speed_bound]
        if v[:sid] == pick[:sid]
          v[:len] = 0
        else
          fix_len = 0
          #if v[:spec] && v[:kind] != pick[1][:kind]
          #  fix_len = v[:spec] *max_len
          #  round_msg << "#{k}增加#{(v[:spec]*100).to_i}%行动条"
          #end
          v[:len] = [(pick_cost * actual_speed + fix_len + v[:len]), max_len].min
        end
        v[:cost] = (max_len - v[:len]) * 1.00 / actual_speed
      end
      @result["round-#{i}"][:msg] = round_msg
    end

  end

  def get_skill(obj)
    if obj[:kind] == 'blue'
      parties = JSON.parse(YYS_REDIS.get('blue')).map { |x| x.deep_symbolize_keys }.select { |x| x[:sid] != obj[:sid] }
      targets = JSON.parse(YYS_REDIS.get('red')).map { |x| x.deep_symbolize_keys }.select { |x| !x[:die] }
    else
      parties = JSON.parse(YYS_REDIS.get('red')).map { |x| x.deep_symbolize_keys }.select { |x| x[:sid] != obj[:sid] }
      targets = JSON.parse(YYS_REDIS.get('blue')).map { |x| x.deep_symbolize_keys }.select { |x| !x[:die] }
    end

    skill, target = YysAiSkill.new.ai_skill_200(1, parties, targets)

    obj[:round_skill] = skill
    obj[:round_target] = target

    obj[:round_begin_resource] = ''
    obj[:round_end_resource] = ''
    obj[:round_begin_point] = ''
    obj[:round_end_point] = ''

  end

  def ahead_attr(type, sids = [], mids = [])
    ahead_armor_sids = ['280'] # 先机防御：辉夜姬
    ahead_speed_sids = ['326', '330'] # 先机速度：sp驴、不知火

    armor_sids = sids & ahead_armor_sids
    speed_sids = sids & ahead_speed_sids

    # 鬼火
    init_resource = 4
    ahead_resource_sids = ['205'] # 先机鬼火：座敷童子
    ahead_resource_mitamas = ['107'] # 先机鬼火：火灵

    if (sids & ahead_resource_sids).present?
      init_resource += 3
    end

    if (mids & ahead_resource_mitamas).present?
      init_resource += 3
    end

    # 鬼火不能超过8
    init_resource = [init_resource, 8].min

    # 鬼火条
    init_point = 0
    ahead_point_sids = ['295'] # 先机鬼火条：追月神
    if (sids & ahead_point_sids).present?
      init_point += 4
    end

    case type
    when 'speed'
      return 0 if speed_sids.blank?
      speed_bound = 0
      if speed_sids.include? '326'
        speed_bound += 20
      end
      if speed_sids.include? '330'
        speed_bound += 20
      end
      return speed_bound
    when 'armor'
      return 0 if armor_sids.blank?
      if armor_sids.include? '280'
        return 0.2
      end
    when 'resource'
      return init_resource
    when 'point'
      return init_point
    else
      0
    end
  end

  # 计算其余五个目标受到的伤害
  def get_damage(obj)

    damage = {}
    if obj[:kind] == 'blue'
      targets = JSON.parse(YYS_REDIS.get('red')).select { |x| !x[:die] }
    else
      targets = JSON.parse(YYS_REDIS.get('blue')).select { |x| !x[:die] }
    end
    min_self_damage = obj[:damage] * (1 + obj[:damage_bound])
    max_self_damage = obj[:damage] * (1 + obj[:damage_bound]) * obj[:crit_damage] / 100

    # 技能加成
    skill_rate = 1

    # 裁判旗
    flag_rate = 1

    # 友方伤害加成
    damage_rate = 1

    # 浮动伤害
    float_rate = [1.01, 0.99].sample

    targets.each do |tt|
      tt = tt.deep_symbolize_keys
      damage[tt[:sid]] = {}
      target_rate = 1

      # todo 目标伤害加深

      # 目标血线导致的额外加成（御魂、技能等）
      mitama_rate = 1
      target_rate = target_rate * mitama_rate

      # 防御计算
      total_armor = tt[:armor] + tt[:armor_bound]
      armor_rate = total_armor * 1.00 / (total_armor + 300)
      target_rate = target_rate * armor_rate

      min_actual_damage = min_self_damage * skill_rate * flag_rate * damage_rate * float_rate * target_rate
      max_actual_damage = max_self_damage * skill_rate * flag_rate * damage_rate * float_rate * target_rate
      damage[tt[:sid]][:sname] = tt[:sname]
      damage[tt[:sid]][:curr_health] = tt[:curr_health]
      damage[tt[:sid]][:min_damage] = min_actual_damage.to_i
      if tt[:crit_chance] >= 100
        damage[tt[:sid]][:min_damage] = max_actual_damage.to_i
      end
      damage[tt[:sid]][:max_damage] = max_actual_damage.to_i
    end
    obj[:actual_damage] = damage
  end

  def summon
    number = params[:number].to_i
    number = 2000 if number > 2000
    all = params[:mode] ? true : false # 是否全图

    @show_cartoon = params[:cartoon] ? true : false # 是否展示抽卡动画

    summon = YysSummon.first
    summon_mode = summon.yys_summon_mode

    if summon_mode.code == 'SP'
      @result, @summon_count = summon_sp(number, all, summon.up_count)
    elsif summon_mode.code == 'SSR'
      @result, @summon_count = summon_ssr(number, all, summon.up_count)
    elsif summon_mode.code == 'SJ'
      @result, @summon_count = summon_sj(number, all, summon.up_count)
    else
      up_count = 0
      summon_common(number, up_count)
    end
  end

  def summon_common(number, up_count)
    ssrs = YysShiShen.ssr
    sps = YysShiShen.sp

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
        else
          # sp
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
    spec_ss = YysShiShen.spec.last
    ssrs = YysShiShen.ssr.where.not(sid: spec_ss.sid)
    sps = YysShiShen.sp

    result = {}
    spec_flag = true

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
        else
          # sp
          ss = sps[rand(sps.size)]
        end
        result[num + 1] = {}
        result[num + 1][:sid] = ss.sid
        result[num + 1][:name] = ss.name
        result[num + 1][:name_sp] = ss.name_sp
        result[num + 1][:cartoon] = ss.cartoon
        result[num + 1][:cartoon_sp] = ss.cartoon_sp
      end

      # if num == 519
      #   result[num + 1] ||= {}
      #   result[num + 1][:name] ||= ''
      #   result[num + 1][:name] = result[num + 1][:name] + "<span style='color:#111de0;font-weight:bold;'>【月之符咒】</span>"
      # end
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

    spec_ss = YysShiShen.spec.last

    ssrs = YysShiShen.ssr
    sps = YysShiShen.sp.where.not(sid: spec_ss.sid)

    result = {}
    spec_flag = true

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
        else
          # sp
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

    ssrs = ShiShen.ssr
    sps = ShiShen.sp

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
        else
          # sp
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
      cookies[:yys_nick_name] = { value: "#{region_name}-#{params[:name]}", expires: 30.days }
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
