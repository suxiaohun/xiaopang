module YysAiTarget

  def ai_target_200(skill, targets = [])
    targets.sort_by! { |x| x[:health_percent] }
    case skill
    when 1
      if targets.first[:health_percent] < 0.2
        targets.first
      else
        targets.sample
      end
    when 2
      targets.first
    when 3
      targets.sample
    else
      #
    end
  end
end