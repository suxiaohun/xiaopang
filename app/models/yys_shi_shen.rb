class YysShiShen < ApplicationRecord

  validates_uniqueness_of :sid

  attr_accessor :color, :owned

  def show_color
    if self.kind == 'kind'
      'rgb(232,112,30)'
    else
      'rgb(232,112,30)'
    end
  end

  scope :spec, -> { where("form = 'ORIGIN' and (kind ='SP' or kind ='SSR')") }
  scope :sp, -> { where("form = 'ORIGIN' and kind ='SP'") }
  scope :ssr, -> { where("form = 'ORIGIN' and kind ='SSR'") }

end
