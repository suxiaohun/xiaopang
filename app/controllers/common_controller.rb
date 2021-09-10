class CommonController < ApplicationController
  include XiuxianInfo



  def test

    @c = %w(1607327664672)
  end

  def index
  end


  def colors

  end



  def skills
    @skills = []
    100.times do
      @skills << rand_skill
    end
  end

  def items
    @items = []
    100.times do
      @items << rand_item
    end
  end

  def groups
    @groups = []
    100.times do
      @groups << rand_group
    end
  end


end
