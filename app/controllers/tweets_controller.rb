class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render 'new'
    else
      if @tweet.save
        redirect_to tweets_path, notice:"つぶやきました！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
