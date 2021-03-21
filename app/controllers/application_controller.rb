class ApplicationController < ActionController::Base


  def check_user_login!
    unless logged_in?
      flash[:error] = "You must logged in to access this section"
      result = {"message": "请先登录"}
      render json: result.to_json, status: 401
    end
  end

  def logged_in?
    current_user
  end

  def log_out
    @current_user = nil
    session.clear
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def rate_limit!
    log_payload = {
      rate_limit_params: {
        key_id: current_user.uuid,
        limit: current_user.rate_limit_limit,
        window: current_user.rate_limit_window,
        daily_limit: current_user.daily_limit,
        idnumber_limit: current_user.idnumber_rate_limit_limit,
        idnumber_window: current_user.idnumber_rate_limit_window,
        idnumber_total_limit: current_user.idnumber_total_limit
      },
      rate_limit_result: {
        status: :error
      }
    }
    logger.measure_info(
      'rate_limit',
      on_exception_level: :error,
      payload: log_payload
    ) do
      @__limit,
        @__window_remain,
        @__reset,
        @__daily_remain = settings.rate_limiter.limit(
        current_user.uuid,
        current_user.rate_limit_limit,
        current_user.rate_limit_window,
        current_user.daily_limit
      )

      log_payload[:rate_limit_result].merge!(
        window_remain: @__window_remain,
        daily_remain: @__daily_remain
      )

      if @__window_remain < 0
        raise RateLimitError::RateLimitExceeded, 'rate limit exceeded'
      end

      if @__daily_remain < 0
        raise RateLimitError::RateLimitExceeded, 'daily limit exceeded'
      end

      if idnumber_rate_limit?
        @__idnumber_limit,
          @__idnumber_window_remain,
          @__idnumber_reset,
          @__idnumber_daily_remain = settings.rate_limiter.limit(
          current_user.uuid,
          current_user.idnumber_rate_limit_limit,
          current_user.idnumber_rate_limit_window,
          current_user.daily_limit,
          'idnumber_limit'
        )

        log_payload[:rate_limit_result].merge!(
          idnumber_window_remain: @__idnumber_window_remain
        )

        if current_user.key_type == 0
          idnumber_total_limit_check!(current_user)
        end

        if @__idnumber_window_remain < 0
          raise RateLimitError::RateLimitExceeded, 'rate limit exceeded'
        end
      end

      log_payload[:rate_limit_result][:status] = :ok
    end
  end


end
