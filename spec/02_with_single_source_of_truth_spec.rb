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
# reset classes so the other file can work:

require "twitter_one_to_many/twitter_with_single_source_of_truth"

RSpec.describe "Single Source of Truth" do 
  describe "User" do 
    describe "#initialize" do
      it "takes a hash of attributes including a username as an argument" do 
        expect{ SSoT::User.new(username: "Dakota") }.not_to raise_error
      end

      it "assigns the value of username within the hash as the value of the @username instance variable" do 
        user = SSoT::User.new(username: "Jose")
        expect(user.instance_variable_get("@username")).to eq("Jose")
      end

    end

    describe "#username" do
      it "returns the value of the username attribute" do 
        user = SSoT::User.new(username: "Angela")
        expect(user.username).to eq("Angela")
      end
    end
  end

  describe "Tweet" do 
    describe "#initialize" do
      it "takes a hash of attributes including a message and a user as an argument" do 
        user = SSoT::User.new(username: "Dakota")
        expect{ SSoT::Tweet.new(message: "A burrito sounds really good right about now. #hungry", user: user) }.not_to raise_error
      end

      it "assigns the value of message in the attributes hash as the value of the @message instance variable" do 
        user = SSoT::User.new(username: "Jose")
        tweet = SSoT::Tweet.new(message: "This new computer is awesome!!!", user: user)
        expect(tweet.instance_variable_get("@message")).to eq("This new computer is awesome!!!")
      end

      it "assigns the value of the user in the attributes hash as the value of the @user instance variable (this represents the user that created the tweet)" do 
        user = SSoT::User.new(username: "Joshua")
        tweet = SSoT::Tweet.new(message: "Chia seeds, Almond milk and Honey in a mason jar overnight = happiness", user: user)
        expect(tweet.instance_variable_get("@user")).to eq(user)
      end

      it "adds new tweets to a class variable called @@all" do 
        user = SSoT::User.new(username: "Sandra")
        tweet = SSoT::Tweet.new(message: "Lennon has a mouth full of the rug again #everythingisfood", user: user)
        expect(SSoT::Tweet.class_variable_get("@@all")).to include(tweet)
      end
    end

    describe ".all" do 
      it "returns an array of all tweets created" do 
        user = SSoT::User.new(username: "Dakota")
        tweet_1 = SSoT::Tweet.new(message: "When you're so tired you learn to lucid dream that you're stilling doing your homework #timetofly", user: user)
        tweet_2 = SSoT::Tweet.new(message: "If I only had to eat spinach curry for the rest of my life, I think that'd just be ok", user: user)
        expect(SSoT::Tweet.all).to include(tweet_1)
        expect(SSoT::Tweet.all).to include(tweet_2)
      end
    end


    describe "#message" do
      it "returns the value of the tweet's message attribute" do 
        user = SSoT::User.new(username: "Angela")
        tweet = SSoT::Tweet.new(message: "When you make it to the burrito place right before it closes #relieved", user: user)
        expect(tweet.message).to eq("When you make it to the burrito place right before it closes #relieved")
      end
    end

    describe "#username" do
      it "returns the username of the user who made the tweet" do 
        user = SSoT::User.new(username: "Angela")
        tweet = SSoT::Tweet.new(message: "When you make it to the burrito place right before it closes #relieved", user: user)
        expect(tweet.username).to eq("Angela")
      end
    end
  end

  describe "User has many tweets" do
    describe "#tweets" do 
      it "returns an array of tweets belonging to the user" do 
        user = SSoT::User.new(username: "Adam") 
        tweet = SSoT::Tweet.new(message: "I'm so glad this project is done! #proud", user: user)
        expect(user.tweets).to include(tweet)
        expect(user.instance_variable_get("@tweets")).to eq(nil)
      end
    end
    
    describe "User#post_tweet(message)" do 
      it "creates a tweet instance, associates it with the user and returns it" do 
        user = SSoT::User.new(username: "Katelyn")
        tweet = user.post_tweet("Ruby is awesome!!!")
        expect(user.tweets.length).to eq(1)
        expect(user.tweets.first).to be_a(SSoT::Tweet)
        expect(user.tweets.first.message).to eq("Ruby is awesome!!!")
        expect(tweet).to be_a(SSoT::Tweet)
      end
    end
  end
end