module Fwk
  module TimeExpend

    def to_strf
      beginning = Time.now.beginning_of_day
      if self > beginning
        self.strftime('%H:%M')
      else
        self.strftime('%Y-%m-%d %H:%M')
      end
    end

  end
end