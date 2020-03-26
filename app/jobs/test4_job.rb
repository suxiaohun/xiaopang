class Test4Job < ApplicationJob
  sidekiq_options retry: 5

  queue_as :default

  def perform(*args)
    $worker_count ||= 0
    # Do something later
    $worker_count += 1
    raise "error....#{$worker_count}" unless $worker_count/5 == 0

  end
end
