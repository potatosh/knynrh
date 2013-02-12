require 'chatroid'

class Knynrh
  module Hi

    private

    def launch
      Chatroid.new do
        set :service, 'Twitter'
        set :consumer_key, ENV['CONSUMER_KEY']
        set :consumer_secret, ENV['CONSUMER_SECRET']
        set :access_key, ENV['ACCESS_KEY']
        set :access_secret, ENV['ACCESS_SECRET']

        on_time :hour => 19, :min => 40, :sec => 0 do
          tweet 'hi'
        end
      end.run!
    end
  end
end
