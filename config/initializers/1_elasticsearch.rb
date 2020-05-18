ES_BOOK_CLIENT = Elasticsearch::Client.new(
    host: 'http://172.21.0.2:9200',
    retry_on_failure: 0,
    log: true,
    transport_options: {request: {timeout: 3}}
)