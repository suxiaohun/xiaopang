class YysBaseAi

  YysShiShen.pluck(:sid).each do |sid|
    define_method "ai_skill_#{sid}".to_sym do |point, parties, targets|
      puts 'super'
      if point < 2
        1
      else
        false
      end
    end
  end

end