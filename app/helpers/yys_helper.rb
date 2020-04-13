module YysHelper

  def region_drop_list
    YysRegion.order(:id).pluck(:name, :key)
  end

  # 图鉴列表，不包含最新活动式神、联动式神
  def user_shi_shen_atlas
    spec_shi_shen_id = SPEC_SID

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
