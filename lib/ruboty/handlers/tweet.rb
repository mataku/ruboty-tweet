module Ruboty
  module Handlers
    class Tweet < Base
      on(
        /tweet (?<body>.+)/,
        name: 'tweet',
        description: 'ツイートします'
      )

      on(
        /randomデ$/,
        name: 'random',
        description: 'ランダムなツイートをします',
        all: true,
        missing: true
      )

      def tweet(message)
        Ruboty::Tweet::Actions::Post.new(message).call
      end

      def random(message)
        Ruboty::Tweet::Actions::Random.new(message).call
      end
    end
  end
end
