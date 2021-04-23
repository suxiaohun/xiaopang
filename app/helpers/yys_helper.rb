module YysHelper

  def shishen_list
    YysShiShen.pluck(:name, :sid)
  end

  def mitama_list
    YysMitama.pluck(:name, :mid)
  end

  def position_list
    list = []
    5.times do |i|
      list << [i + 1, i + 1]
    end
    list
  end

  def rand_profile(type)
    case type
    when 'damage'
      1000 + rand(6000)
    when 'health'
      10000 + rand(25000)
    when 'armor'
      500 + rand(700)
    when 'speed'
      100 + rand(120)
    when 'crit_chance'
      5 + rand(110)
    when 'crit_damage'
      150 + rand(160)
    when 'hit'
      rand(90)
    when 'resist'
      20 + rand(80)
    else
      0
    end
  end

  def rand_shishen_resource(i)
    sid = []
    sid << 205 # 座敷童子
    sid << 266 # 青行灯
    sid << 280 # 辉夜姬
    sid << 295 # 追月神
    sid << 323 # 天井下
    sid << 298 # 薰

    sid[i]
  end

  def rand_sid
    YysShiShen.pluck(:sid).sample
  end

  def round_pick(n)

    ss = 221, 203, 187, 186, 165, 143, 135, 132, 128, 121

    _hash = {}
    ss.each_with_index do |s, i|
      _hash[s] = ss[0] * 1.00 / s
    end

    n.times do |i|

      min = _hash.values.min

      key = _hash.key min

      puts "round-#{i}: #{key}"

      fix_step = 0

      fix_step = 0.2 if key == 143

      _hash[key] += ss[0] * (1 - fix_step) * 1.00 / key
    end

  end

  def last_patch
    YysPatch.last
  end

  def patch_list
    YysPatch.order(id: :desc).pluck(:version, :content)
  end

  def region_drop_list
    YysRegion.order(:id).pluck(:name, :key)
  end

  def region_mode_drop_list
    YysRegion.all.pluck(:mode).uniq
  end

  def user_shi_shen_atlas
    spec_shi_shen_id = YysShiShen.spec.last.try(:id)

    list = []
    user_atlas = YysAtlas.find_by(nick_name: cookies[:yys_nick_name]).try(:sids) || []

    if user_atlas.count > 0
      YysShiShen.where(kind: 'origin').where.not(sid: spec_shi_shen_id).order(sid: :desc).each do |x|
        if user_atlas.include? x.sid
          x.owned = true
        else
          x.owned = false
        end
        list << x
      end
    else
      YysShiShen.where(kind: 'origin').where.not(sid: spec_shi_shen_id).order(sid: :desc).each do |x|
        x.owned = true
        list << x
      end
    end
  end

end
