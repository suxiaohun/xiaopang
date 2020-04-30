unless Rails.env == "test"

# client allows instrumentation to send info to server
  require 'prometheus_exporter/client'
  require 'prometheus_exporter/instrumentation'
  require 'prometheus_exporter/middleware'
  require 'prometheus_exporter/server'

  PrometheusExporter::Metric::Base.default_prefix = "ruby_"
  PrometheusExporter::Metric::Base.default_labels = { "project" => "xiaopang" }

# bind is the address, on which the webserver will listen
# port is the port that will provide the /metrics route
  server = PrometheusExporter::Server::WebServer.new bind: 'localhost', port: 9394
  server.start

# wire up a default local client
  PrometheusExporter::Client.default = PrometheusExporter::LocalClient.new(collector: server.collector)

  gauge = PrometheusExporter::Metric::Gauge.new("rss", "used RSS for process")
  counter = PrometheusExporter::Metric::Counter.new("web_requests", "number of web requests")
  summary = PrometheusExporter::Metric::Summary.new("page_load_time", "time it took to load page")
  histogram = PrometheusExporter::Metric::Histogram.new("api_access_time", "time it took to call api")

  server.collector.register_metric(gauge)
  server.collector.register_metric(counter)
  server.collector.register_metric(summary)
  server.collector.register_metric(histogram)

  gauge.observe(server.get_rss)
  gauge.observe(server.get_rss)


  counter.observe
  counter.observe

  # this reports basic process stats like RSS and GC info
  PrometheusExporter::Instrumentation::Process.start(type: "master")
  # This reports stats per request like HTTP status and timings
  Rails.application.middleware.unshift PrometheusExporter::Middleware
end

