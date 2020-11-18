# frozen_string_literal: true

namespace :twirp do
  desc 'Call the server for testing'
  task fetch_something: :environment do
    client = MyServiceClient.new(ENV['MY_SERVICE_URL'])
    resp = client.fetch_something(Google::Protobuf::Empty.new)

    puts resp.data
  end
end
