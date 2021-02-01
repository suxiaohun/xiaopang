ActiveSupport.on_load :active_job do
  class ActiveJob::LogSubscriber
    private

    def format(arg)
      case arg
      when Hash
        arg.transform_values { |value| format(value) }
      when Array
        arg.map { |value| format(value) }
      when GlobalID::Identification
        arg.to_global_id rescue arg
      when String
        if arg.size > 1000
          "MD5-(#{Digest::MD5.hexdigest(arg)})"
        else
          arg
        end
      else
        arg
      end

    end
  end
end