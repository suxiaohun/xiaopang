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



end
