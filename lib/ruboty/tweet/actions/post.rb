require 'twitter'

module Ruboty
  module Tweet
    module Actions
      class Post < Ruboty::Actions::Base
        def call
          message.reply(message.from)
          message.reply(message.from_name)
          # client.update(message[:body])
          message.reply(success_message)
        rescue => e
          reply_error(e)
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

        def reply_error(e)
          message.reply(failure_message)
          message.reply("```#{e.message}```")
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
