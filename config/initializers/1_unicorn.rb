require './lib/unicorn_metrics'
if defined?(UnicornMetrics)
  UnicornMetrics.configure do |c|
    c.http_metrics = true
    c.register(:request_timer, 'summon_post', 'POST', %r{\/yys\/summon})
  end
end
