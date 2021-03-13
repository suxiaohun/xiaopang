class ApplicationController < ActionController::Base


  def check_user_login!
    unless logged_in?
      flash[:error] = "You must logged in to access this section"
      result = {"message": "请先登录"}
      render json: result.to_json, status: 401
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


end
