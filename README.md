# One to Many Relationships

## Objectives

* Implement one object to many objects relationship
  * One object has many objects
  * One object belongs to another object
* Practice passing custom objects as arguments to methods
* Demonstrate single source of truth

## Deliverables

* Create a User class. The class should have these methods:
  * `#initialize` which takes a username as an argument
  * a reader method for the username
  * `#tweets` that returns an array of Tweet instances
  * `#post_tweet` that takes a message as an argument, creates a new tweet, and adds it to the user's tweet collection
* Create a Tweet class. The class should have these methods:
  * `Tweet#message` that returns a string
  * `Tweet#user` that returns an instance of the user class
  * `Tweet.all` that returns all the Tweets created.
  * `Tweet#username` that returns the username of the tweet's user

## Notes

How do we add getter methods for attributes? Which attribute macro do we use to generate a getter method?

```rb
attr_reader :username
```

If you want a setter:

```rb
attr_writer :username
```

If you want both getter and setter:

```rb
attr_accessor :username
```
