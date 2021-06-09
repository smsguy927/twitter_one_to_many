class User 
  attr_reader :username, :tweets
  def initialize(username)
    @username = username
    @tweets = []
  end

  def post_tweet(message)
    Tweet.new(message, self)
  end
end

class Tweet 
  @@all = []

  def self.all
    @@all
  end

  attr_reader :message, :user
  def initialize(message, user)
    @message = message
    @user = user
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

  private 
  # methods for internal use (within the class) only
  def helper_method 

  end
end