class TweetsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.create(tweet_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = 'Tweet deleted successfully'
    redirect_to root_path
    end



  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end



end
