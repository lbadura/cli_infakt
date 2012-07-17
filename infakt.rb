require 'rubygems'
require 'oauth'
require 'json'

class Connection
  attr_accessor :access_token, :consumer

  USER_NAME = 'clinfakt'
  PASSWORD = 'clinfakt'
  CONSUMER_KEY = '11oQd1glI3J0xFAZwteA'
  CONSUMER_SECRET = 'YvnwtLzGU6CKqgnAK6ECOIadsQB2nGHfuWmnt8'

  def fetch_access_token
    @consumer = OAuth::Consumer.new(
      Connection::CONSUMER_KEY,
      Connection::CONSUMER_SECRET,
      :site => 'https://www.infakt.pl'
    )

    @access_token = consumer.get_access_token(nil, {}, {
      :x_auth_mode => "client_auth",
      :x_auth_username => Connection::USER_NAME,
      :x_auth_password => Connection::PASSWORD,
    })

    [consumer, access_token]
  end
end

c = Connection.new
c.fetch_access_token

puts c.access_token
