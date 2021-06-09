# * Create a User class. The class should have these methods:
#   * `User#initialize` which takes a username
#   * `User#username` reader method
#   * `User#tweets` that returns an array of Tweet instances
#   * `User#post_tweet` that takes a message, creates a new tweet, and adds it to the user's tweet collection
# * Create a Tweet class. The class should have these methods:
#   * `Tweet#message` that returns a string
#   * `Tweet#user` that returns an instance of the user class
#   * `Tweet.all` that returns all the Tweets created.
#   * `Tweet#username` that returns the username of the tweet's user
require "twitter_one_to_many/twitter_without_single_source_of_truth"
RSpec.describe "User" do 
  describe "#initialize" do
    it "takes a username as an argument" do 
      expect{ User.new("Dakota") }.not_to raise_error
    end

    it "assigns the username argument as the value of the @username" do 
      user = User.new("Jose")
      expect(user.instance_variable_get("@username")).to eq("Jose")
    end

    it "creates a @tweets attribute the will contain an array of tweets" do 
      user = User.new("Rumiko")
      expect(user.instance_variable_get("@tweets")).to be_an(Array)
      expect(user.instance_variable_get("@tweets").length).to eq(0)
    end
  end

  describe "#username" do
    it "returns the value of the username attribute" do 
      user = User.new("Angela")
      expect(user.username).to eq("Angela")
    end
  end

  describe "#post_tweet(message)" do 
    it "creates a tweet instance, associates it with the user and returns it" do 
      user = User.new("Katelyn")
      tweet = user.post_tweet("Ruby is awesome!!!")
      expect(user.tweets.length).to eq(1)
      expect(user.tweets.first).to be_a(Tweet)
      expect(user.tweets.first.message).to eq("Ruby is awesome!!!")
      expect(tweet).to be_a(Tweet)
    end
  end

  describe "#tweets" do 
    it "returns an array of tweets belonging to the user" do 
      user = User.new("Adam") 
      expect(user.tweets).to eq(user.instance_variable_get("@tweets"))
    end
  end
end

RSpec.describe "Tweet" do 
  describe "#initialize" do
    it "takes a message and a user as arguments" do 
      user = User.new("Dakota")
      expect{ Tweet.new("A burrito sounds really good right about now. #hungry", user) }.not_to raise_error
    end

    it "assigns the message argument as the value of the @message" do 
      user = User.new("Jose")
      tweet = Tweet.new("This new computer is awesome!!!", user)
      expect(tweet.instance_variable_get("@message")).to eq("This new computer is awesome!!!")
    end

    it "creates a @user attribute that will store the user who made the tweet" do 
      user = User.new("Joshua")
      tweet = Tweet.new("Chia seeds, Almond milk and Honey in a mason jar overnight = happiness", user)
      expect(tweet.instance_variable_get("@user")).to eq(user)
    end

    it "adds new tweets to a class variable called @@all" do 
      user = User.new("Sandra")
      tweet = Tweet.new("Lennon has a mouth full of the rug again #everythingisfood", user)
      expect(Tweet.class_variable_get("@@all")).to include(tweet)
    end
  end

  describe ".all" do 
    it "returns an array of all tweets created" do 
      user = User.new("Dakota")
      tweet_1 = Tweet.new("When you're so tired you learn to lucid dream that you're stilling doing your homework #timetofly", user)
      tweet_2 = Tweet.new("If I only had to eat spinach curry for the rest of my life, I think that'd just be ok", user)
      expect(Tweet.all).to include(tweet_1)
      expect(Tweet.all).to include(tweet_2)
    end
  end

  describe "#username" do
    it "returns the username of the user who made the tweet" do 
      user = User.new("Angela")
      tweet = Tweet.new("When you make it to the burrito place right before it closes #relieved", user)
      expect(tweet.username).to eq("Angela")
    end
  end

  describe "#message" do
    it "returns the value of the tweet's message attribute" do 
      user = User.new("Angela")
      tweet = Tweet.new("When you make it to the burrito place right before it closes #relieved", user)
      expect(tweet.message).to eq("When you make it to the burrito place right before it closes #relieved")
    end
  end
end