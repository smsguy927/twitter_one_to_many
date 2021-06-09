class User 
  attr_reader :username, :tweets
  def initialize(username)
    @username = username
    @tweets = []
  end

  def post_tweet(message)
    tweet = Tweet.new(message, self)
    # @tweets << tweet
    tweet
    # or 
    # @tweets << Tweet.new(message, self)
    # @tweets.last
  end
end

# post_tweet method will create a tweet so we need a Tweet class.

class Tweet
  @@all = []

  def self.all
    @@all
  end

  attr_reader :user, :message
  def initialize(message, user)
    @message = message
    @user = user
    @user.tweets << self
    @@all << self
  end

  def username
    self.user.username
  end

  def delete
    Tweet.all.delete(self)
    user.tweets.delete(self)
  end
end