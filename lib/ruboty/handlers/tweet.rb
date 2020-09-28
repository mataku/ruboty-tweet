module Ruboty
  module Handlers
    class Tweet < Base
      on(
        /tweet (?<body>.+)/,
        name: 'tweet',
        description: 'ツイートします'
      )

      on(
        /random/,
        name: 'random',
        description: 'ランダムなツイートをします'
      )

      on(
        /heimin/,
        name: 'heimin',
        description: '平民のツイートをします'
      )

      def tweet(message)
        Ruboty::Tweet::Actions::Post.new(message).call
      end

      def random(message)
        Ruboty::Tweet::Actions::Random.new(message).call
      end

      def heimin(message)
        Ruboty::Tweet::Actions::Heimin.new(message).call
      end
    end
  end
end
