class Firebase::DatabaseService
  FIREBASE_URL = Rails.application.credentials.dig(:firebase, :url).freeze
  FIREBASE_SECRET = Rails.application.credentials.dig(:firebase, :secret).freeze

  attr_reader :firebase_client

  def initialize(firebase_client: Firebase::Client.new(FIREBASE_URL, FIREBASE_SECRET))
    @firebase_client = firebase_client
    @firebase_client.request.connect_timeout = 30
  end

  # get(path, query_options)
  def get(channel, query_options = {})
    return_response(@firebase_client.get(channel, query_options))
  rescue StandardError => e
    handle_error(e, 'get')
  end

  # set(path, data, query_options)
  def post(channel, data, query_options = {})
    return_response(@firebase_client.set(channel, data, query_options))
  rescue StandardError => e
    handle_error(e, 'post')
  end

  # push(path, data, query_options)
  def push(channel, data, query_options = {})
    return_response(@firebase_client.push(channel, data, query_options))
  rescue StandardError => e
    handle_error(e, 'push')
  end

  # update(path, data, query_options)
  def put(channel, data, query_options = {})
    return_response(@firebase_client.put(channel, data, query_options))
  rescue StandardError => e
    handle_error(e, 'put')
  end

  # delete(path, query_options)
  def delete(channel, query_options = {})
    return_response(@firebase_client.delete(channel, query_options, query_options))
  rescue StandardError => e
    handle_error(e, 'delete')
  end

  private

  def return_response(res)
    if res&.success?
      { data: res.body, message: 'Success response', code: res.code, status: 'ok' }
    else
      Sentry.capture_exception("Invalid response #{res}")
      { error: 'Failure', message: 'Invalid response', code: (res&.code || 401), status: 'unprocessable_entity' }
    end
  end

  def handle_error(err, method)
    Sentry.capture_exception(err) if Sentry.initialize?
    { error: err, message: "Invalid Firebase #{method}", code: '401', status: 'unprocessable_entity' }
  end
end
