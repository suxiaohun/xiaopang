class CommonController < ApplicationController
  def test_timeout
    sleep 40
    render json: {:msg => 'test_timeout'}
  end

  def index
  end


  def colors

  end

end
