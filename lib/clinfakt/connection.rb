class Clinfakt::Connection
  attr_accessor :access_token, :consumer

  USER_NAME = ''
  PASSWORD = ''
  CONSUMER_KEY = ''
  CONSUMER_SECRET = ''

  def fetch_access_token
    @consumer = OAuth::Consumer.new(
      CONSUMER_KEY,
      CONSUMER_SECRET,
      :site => 'https://www.infakt.pl'
    )

    @access_token = consumer.get_access_token(nil, {}, {
      :x_auth_mode => "client_auth",
      :x_auth_username => USER_NAME,
      :x_auth_password => PASSWORD,
    })

    [consumer, access_token]
  end
end

