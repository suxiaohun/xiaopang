ES_BOOK_CLIENT = Elasticsearch::Client.new(
    host: XiaopangEnv.elasticsearch_host,
    retry_on_failure: 0,
    log: true,
    transport_options: {request: {timeout: 3}}
)