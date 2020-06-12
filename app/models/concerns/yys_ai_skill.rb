class YysAiSkill < YysBaseAi
  include YysAiTarget

  def ai_skill_200(point, parties, targets)
    skill = super
    return skill, ai_target_200(skill, targets) if skill

    parties.sort_by! { |x| x[:health_percent] }
    re_spawn_ids = parties.map { |x| x[:sid] if x[:re_spawn] }
    if re_spawn_ids.present?
      return 3, ai_target_200(skill, parties)
    end

    if parties.first[:health_percent] < 0.65
      return 2, ai_target_200(skill, parties)
    elsif parties.first[:health_percent] < 0.8
      if rand < 0.25
        return 1, ai_target_200(skill, targets)
      else
        return 2, ai_target_200(skill, targets)
      end
    end
  end


end


