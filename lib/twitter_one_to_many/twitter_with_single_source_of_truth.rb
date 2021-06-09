module SSoT
  # add your classes inside the module in the space below so the tests will work properly.
 
  class User 
    attr_reader :username
    def initialize(username)
      @username = username
    end

    def post_tweet(message)
      Tweet.new(message, self)
    end

    def tweets
      Tweet.all.select { |tweet| tweet.user == self}
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
      @@all << self
    end

    def username 
      user.username
    end

    def delete 
      Tweet.all.delete(self) 
    end

    private 
    # methods for internal use (within the class) only
    def helper_method 

    end
  end


end