class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tweets, :dependent => :destroy
  def self.find_by_or_create(username)
    current_user = TwitterUser.find_by_username(username)
    if current_user != nil
      @user = current_user
    else
      @user = TwitterUser.create(username: username)
    end
    @user
  end

  def fetch_tweets
    tweets = $client.user_timeline(self.username)
    tweets.each do |tweet|
      self.tweets.create(text: tweet.text, twitter_user_id: self.id)
    end
    self.tweets
  end

  def post_tweet(text)
    $client.update(text)
  end
end
