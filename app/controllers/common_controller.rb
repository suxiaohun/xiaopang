class CommonController < ApplicationController
  def index
    Test1Job.perform_later
  end
end
