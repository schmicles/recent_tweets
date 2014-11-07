post '/tweets' do

  #new_tweet = Tweet.create(text: params[:post][:text], twitter_user_id: 1)
  @user = TwitterUser.find_by(params[$client])
  @user.post_tweet(params[:post][:text])
  @tweets = @user.fetch_tweets
  erb :'tweets/show'
end

get '/tweets' do
  @tweets = @user.fetch_tweets
  erb :'tweets/show'
end