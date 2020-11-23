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
        /heimin (?<body>.+)/,
        name: 'heimin',
        description: '平民のツイートをします'
      )

      on(
        /show_list/,
        name: 'show_list',
        description: 'ツイート一覧を表示します'
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

      def show_list(message)
        Ruboty::Tweet::Actions::List.new(message).call
      end
    end
  end
end
