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

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

VCR.use_cassette('user_data') do
  connection = Connection.new
  connection.fetch_access_token
  puts connection.access_token

  response = connection.access_token.get("/api/v2/settings/user_data.json")
  user_data = JSON.load(response.body)
  user_data["user_data"].each do |key, value|
    puts "#{sprintf "%-15s", key}: #{value}"
  end
end

