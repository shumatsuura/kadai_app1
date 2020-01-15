class TweetsController < ApplicationController
  before_action :set_tweet, only:[:show, :edit,:update,:destroy]

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
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "つぶやきを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"つぶやきを削除しました！"
  end

  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
