module Rails
  class <<self
    def root
      File.expand_path(__FILE__).split('/')[0..-3].join('/')
    end
  end
end

listen 3000

worker_processes 4

timeout 30 # default 60

preload_app true

pid "#{Rails.root}/tmp/pids/unicorn.pid"

# stderr_path "#{Rails.root}/log/unicorn_err.log"
# stdout_path "#{Rails.root}/log/unicorn_out.log"

before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(Rails.root, 'Gemfile')
end

#after_fork do |_server, _worker|
#  require 'prometheus_exporter/instrumentation'
#  PrometheusExporter::Instrumentation::ActiveRecord.start(
#      custom_labels: { type: "unicorn_worker" }, #optional params
#      config_labels: [:database, :host] #optional params
#  )
#end
#
#after_fork do |_server, _worker|
#  require 'prometheus_exporter/instrumentation'
#  PrometheusExporter::Instrumentation::Process.start(type:"worker")
#end