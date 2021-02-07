class IdentityController < ApplicationController

  def image_verification
    request_id = SecureRandom.uuid.gsub('-', '')
    binary_a = IO.binread("test/fixtures/files/images/face_01.jpg")
    binary_b = IO.binread("test/fixtures/files/images/face_07.jpg")
    base64_a = Base64.strict_encode64(binary_a)
    base64_b = Base64.strict_encode64(binary_b)

    args = {
      request_id: request_id,
      blob_a: base64_a,
      blob_b: base64_b,
      check_quality: true,
      auto_rotate: true
    }

    puts request_id, QUEUES.sample

    result = amqp_rpc(QUEUES.sample, args)
    puts result

    resp = {
      request_id: request_id,
      code: result['code'],
      score: result['score'],
      message: result['message'] || 'ok'
    }

    render json: resp
  end


  private

  def amqp_rpc(queue_name, args = {})
    channel = RabbitMQ.channel
    queue = channel.queue(queue_name, durable: false)
    queue.publish(args.to_json, routing_key: queue_name)

    _, resp = FACEPRO_REDIS.brpop(args[:request_id], SIDEKIQ_REDIS_POLL_TIMEOUT)
    JSON.parse(resp)
  end

end
