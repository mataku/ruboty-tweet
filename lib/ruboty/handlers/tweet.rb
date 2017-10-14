module Ruboty
  module Handlers
    class Tweet < Base
      on(
        /tweet/,
        name: 'tweet',
        description: 'ツイートします'
      )
    end

    def tweet(message)
      Ruboty::Tweet::Actions::Post.new(message).call
    end
  end
end
