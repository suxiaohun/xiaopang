
# todo 注：不应该放在启动项中，否则rails c会报错，"server地址会重复"
# todo 将其以单独的服务启动(详情查看github)  https://github.com/discourse/prometheus_exporter
#unless Rails.env == "test"
#  require 'prometheus_exporter/instrumentation'
#  require 'prometheus_exporter/middleware'
#  require 'prometheus_exporter/server'
#
#  PrometheusExporter::Metric::Base.default_prefix = "ruby_"
#
#  server = PrometheusExporter::Server::WebServer.new bind: '0.0.0.0', port: 9394
#  server.start
#
#  PrometheusExporter::Instrumentation::Process.start(type: "master")
#
#  Rails.application.middleware.unshift PrometheusExporter::Middleware
#end

