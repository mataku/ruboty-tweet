require 'twitter'

module Ruboty
  module Tweet
    module Actions
      class List < Ruboty::Actions::Base
        def call
          message.reply(tweet_list)
        rescue => e
          reply_error(e)
        end
      
        private

        def tweet_list
          tweets = "```\n"
          File.foreach('config/tweet_list.txt') do |line|
            tweets << line
          end
          tweets += '```'
          tweets
        end

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

        def failure_message
          'ダメだったにゃ'
        end
      end
    end
  end
end
