class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def create
    Tweet.create(tweet_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end



end
