class RabbitMQ
  class << self
    def connection
      rabbitmq_url = ENV["FACEPRO_AMQP"] || "amqp://guest:guest@10.4.5.13:5672"
      @conn ||= Bunny.new(rabbitmq_url).start
    end

    def channel
      @ch ||= connection.create_channel
    end
  end
end