module Rails
  class <<self
    def root
      File.expand_path(__FILE__).split('/')[0..-3].join('/')
    end
  end
end

ENV['RAILS_ENV'] = "production"

listen 3000

worker_processes 8

preload_app true

pid "#{Rails.root}/tmp/pids/unicorn.pid"

stderr_path "#{Rails.root}/log/unicorn_err.log"
stdout_path "#{Rails.root}/log/unicorn_out.log"


