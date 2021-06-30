class User
  attr_reader :username, :tweets

  def initialize(attributes = {})
    @username = attributes[:username]
    @tweets = []
  end

  def post_tweet(message)
    Tweet.new(message: message, user: self)
  end
end


class Tweet

  @@all = []

  def self.all
    @@all
  end

  def self.all_messages
    self.all.map{|tweet| tweet.message}
  end

  attr_reader :message, :user
  # short for this:
  # def message
  #   @message
  # end

  def initialize(attributes = {})
    @message = attributes[:message]
    @user = attributes[:user] 
    @user.tweets << self 
    @@all << self
  end

  def username
    user.username
  end

  def delete
    Tweet.all.delete(self)
    user.tweets.delete(self)
  end
  
end