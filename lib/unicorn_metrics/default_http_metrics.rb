module UnicornMetrics::DefaultHttpMetrics
  def register_default_http_counters
    [
      ["responses_2xx", /[2]\d{2}/], ["responses_3xx", /[3]\d{2}/],
      ["responses_4xx", /[4]\d{2}/], ["responses_5xx", /[5]\d{2}/]
    ].each { |c| register(:response_counter, *c) }
  end

  def register_default_http_timers
    [
      ['requests_GET', 'GET'], ['requests_POST', 'POST'],
      ['requests_DELETE', 'DELETE'], ['requests_HEAD', 'HEAD'],
      ['requests_PUT', 'PUT']
    ].each { |c| register(:request_timer, *c) }
  end
end
