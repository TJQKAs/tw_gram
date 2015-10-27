class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
    format.js { }
  end

  private
  
  def tweet_params
    params.require(:tweet).permit(:message)
  end



end
