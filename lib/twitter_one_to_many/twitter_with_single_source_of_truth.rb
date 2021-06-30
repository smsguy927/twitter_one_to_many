module SSoT
  # add your classes inside the module in the space below so the tests will work properly.

  module SSoT
    # add your classes inside the module in the space below so the tests will work properly.
    # frozen_string_literal: true

    require 'pry'

    class User
      attr_reader :username
      # attr_accessor :tweets

      def initialize(attributes = {})
        @username = attributes[:username]
        # @tweets = []
      end

      def post_tweet(content)
        tweet = Tweet.new({ message: content, user: self })
      end

      def tweets
        Tweet.all.select{|tweet| tweet.user == self}
      end

    end

    sean = User.new(username: 'smsguy927')
    puts sean

    class Tweet
      @@all = []
      def self.all
        @@all
      end

      def initialize(attributes = {})
        @message = attributes[:message]
        @user = attributes[:user]
        @@all << self
        @user.tweets << self
      end

      def username
        @user.username
      end

      def delete
        Tweet.all.delete(self)
        @user.tweets.delete(self)
      end

      attr_reader :message, :user
    end




  end


end