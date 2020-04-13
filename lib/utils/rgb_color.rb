class RgbColor
  class << self

    def colors
      colors = []
      File.open("#{Rails.root.to_s}/lib/utils/files/rgb_color.txt").each_line do |line|
        colors << line.split
      end
      colors
    end


    def rand_color
      @rand_color = colors[rand(colors.length)][1]
    end

    def fav_color
      fav_colors = %w(
                  #FF8C00
                  #DB7093
                  #DB7093
                  #D2B48C
                  #EEE8AA
                  #F5DEB3
                  #EE82EE
                  #00FA9A
                  #FFD700
                  #DAA520
                  #ADFF2F
               )
      fav_colors[rand(fav_colors.length)]
    end



    def lavender
      "#E6E6FA"
    end

    def silver
      "#C0C0C0"
    end


  end

end