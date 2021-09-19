class ToolsController < ApplicationController
  def markdown

  end
  def mirror
    data = {
      "schemaVersion": 2,
      "mediaType": "application/vnd.docker.distribution.manifest.list.v2+json",
      "manifests": [
        {
          "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
          "size": 527,
          "digest": "sha256:59eec8837a4d942cc19a52b8c09ea75121acc38114a2c68b98983ce9356b8610",
          "platform": {
            "architecture": "amd64",
            "os": "linux"
          }
        },
        {
          "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
          "size": 527,
          "digest": "sha256:c84b0a3a07b628bc4d62e5047d0f8dff80f7c00979e1e28a821a033ecda8fe53",
          "platform": {
            "architecture": "arm",
            "os": "linux"
          }
        },
        {
          "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
          "size": 527,
          "digest": "sha256:f365626a556e58189fc21d099fc64603db0f440bff07f77c740989515c544a39",
          "platform": {
            "architecture": "arm64",
            "os": "linux"
          }
        },
        {
          "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
          "size": 527,
          "digest": "sha256:bcf9771c0b505e68c65440474179592ffdfa98790eb54ffbf129969c5e429990",
          "platform": {
            "architecture": "ppc64le",
            "os": "linux"
          }
        },
        {
          "mediaType": "application/vnd.docker.distribution.manifest.v2+json",
          "size": 527,
          "digest": "sha256:882a20ee0df7399a445285361d38b711c299ca093af978217112c73803546d5e",
          "platform": {
            "architecture": "s390x",
            "os": "linux"
          }
        }
      ]
    }
    render json: data
  end

  def img_to_base64

    if request.post?
      content = params[:img].read
      @base64 = Base64.strict_encode64(content)
    end

  end

  def base64_to_img

  end

  def json

  end

  def sign
    if request.post?
      keys = params[:keys]
      values = params[:values]
      sign_str = []
      keys.each_with_index do |k, i|
        sign_str << "#{k}=#{values[i]}" if k.present? && values[i].present?
      end
      @sign_str = sign_str.join('&')

      case params[:hex_type]
      when 'md5'
        @sign = Digest::MD5.hexdigest(@sign_str)
      when 'sha1'
        @sign = Digest::SHA1.hexdigest(@sign_str)
      when 'sha2','sha256'
        @sign = Digest::SHA2.hexdigest(@sign_str)
      else
        @sign = 'unsupported hex type'
      end
    end
  end

  def sha1

  end

  def compress

  end

  def sense

  end

  def sense_encode
    api_key = params[:api_key].blank? ? '5f3c59ad4271425cac8c27e24b6b4468' : params[:api_key]
    api_secret = params[:api_secret].blank? ? '7ce86784b8744975808b10d5c7c17801' : params[:api_secret]
    client_source = params[:client_source].blank? ? 'ice' : params[:client_source]
    timestamp = params[:timestamp].blank? ? (Time.now.to_f * 1000).to_i.to_s : params[:timestamp]
    nonce = params[:nonce].blank? ? SecureRandom.uuid.gsub("-", "") : params[:nonce]
    body = params[:body].blank? ? '' : (params[:body] || '')

    md5_body = md5_body(body)
    data = [api_key, client_source, timestamp, nonce, md5_body].sort.join('')
    valid_sign = hmac_sha256(data, api_secret)

    @data = {}
    @data[:api_key] = api_key
    @data[:api_secret] = api_secret
    @data[:client_source] = client_source
    @data[:timestamp] = timestamp
    @data[:nonce] = nonce
    @data[:body] = body
    @data[:md5_body] = md5_body
    @data[:sign] = valid_sign
    @data[:data] = data

    @str = ""

    @data.each do |kk, vv|
      @str << "#{kk.to_s.ljust(20, '-')}  #{vv}<br>"
    end

    puts @str

  end

  def json_format

  end

  def colors

  end

  def mobile_area
  end

  def get_mobile_area
    mobile_number = params[:mobile_number].to_s.gsub(/[^0-9]/, '')
    mobile_number = mobile_number[0, 7]
    @mobile_area = '无记录'
    @mobile_number = mobile_number
    if mobile_number.size >= 7
      type, area_code = check_mobile_number(mobile_number)
      if type == 'Mobile'
        phone_info = PhoneInfo.find_by mobile_number: mobile_number
      elsif type == 'Fixed Line'
        phone_info = PhoneInfo.find_by(area_code: area_code) if area_code
      end
      if phone_info
        @mobile_area = phone_info.try(:mobile_area)
        @mobile_number = phone_info.try(:mobile_number)
      end
    else
      @mobile_area = '至少输入7位数字'
    end
    puts "#{@mobile_number} #{@mobile_area}"
  end

  def comment_save
    @comment = Comment.new(comment_params)
    @comment.created_by = cookies[:nick_name]
    @comment.save
  end


  def rpc
    # socket = Socket.new(Socket::AF_INET,Socket::SOCK_STREAM)
    server = Socket.new(:AF_INET,:SOCK_STREAM)

    addr = Socket.pack_sockaddr_in(4481,'0.0.0.0')
    server.bind addr
    server.listen(5)

    Socket.accept_loop(server) do |connection|
      puts connection

      connection.close
    end
  end

  def rpc2
    Socket.tcp_server_loop(4481) do |conn|
      puts conn
      conn.close
    end

  end

  private

  def md5_body(data)
    md5 = Digest::MD5.new
    md5.update(data)
    md5.hexdigest
  end

  def hmac_sha256(data, secret)
    digest = OpenSSL::Digest.new('sha256')
    OpenSSL::HMAC.hexdigest(digest, secret, data)
  end

  def check_mobile_number(number)
    case number
    when /^0[12]/
      return 'Fixed Line', number[0, 3]
    when /^0[3-9]/
      return 'Fixed Line', number[0, 4]
    when /^852/
      return 'Fixed Line', '852'
    when /^853/
      return 'Fixed Line', '852'
    when /^886/
      return 'Fixed Line', '852'
    when /^1/
      'Mobile'
    else
      'UNKNOWN'
    end
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:content)
  end

end
