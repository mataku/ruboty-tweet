require 'twitter'

module Ruboty
  module Tweet
    module Actions
      class Post < Ruboty::Actions::Base
        def call
          client.update(message)
          message.reply(success_message)
        rescue => e
          message.reply(failure_message + '\n' + e.message)
        end
      
        private

        def client
          @client = Twitter::REST::Client.new do |c|
            c.consumer_key = ENV['TWITTER_CONSUMER_KEY']
            c.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
            c.access_token = ENV['TWITTER_ACCESS_TOKEN']
            c.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
          end
        end

        def success_message
          'ツイートしたにゃ'
        end

        def failure_message
          'ダメだったにゃ'
        end
      end
    end
  end
end
