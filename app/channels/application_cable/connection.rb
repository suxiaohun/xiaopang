module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    # 验证user信息,有两种形式cookie或session
    def find_verified_user
      rand_num = (SecureRandom.rand * 1000000).round(6).to_i.to_s
      verified_user = cookies[:nick_name] || 'user_' + rand_num
      # verified_user = User.find_by(id: cookies.encrypted[:user_id])
      if verified_user
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
