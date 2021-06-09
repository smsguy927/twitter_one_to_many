# One to Many Relationships

## Objectives

* Implement one object to many objects relationship
  * One object has many objects
  * One object belongs to another object
* Practice passing custom objects as arguments to methods
* Demonstrate single source of truth

## Deliverables

* Create a User class. The class should have these methods:
  * `#initialize` which takes a username and has
  * a reader method for the username
  * `#tweets` that returns an array of Tweet instances
  * `#post_tweet` that takes a message, creates a new tweet, and adds it to the user's tweet collection
* Create a Tweet class. The class should have these methods:
  * `Tweet#message` that returns a string
  * `Tweet#user` that returns an instance of the user class
  * `Tweet.all` that returns all the Tweets created.
  * `Tweet#username` that returns the username of the tweet's user

## Notes

Belongs To:

When we say that one object belongs_to another, we're saying that it stores a reference to the object it belongs to.

```rb
class Tweet
  def initialize(message, user)
    @message = message
    @user = user
  end
end
```

When we say

```rb
@user = user
```
We are storing a reference to the user that created the tweet. So, this tweet *belongs to* that user. We'll usually also have a method with the same name that can be used to retrieve the instance variable that's storing that reference.

```rb
attr_reader :user
```

How to create a tweet from the User class:

```rb
Tweet.new(message, self)

```