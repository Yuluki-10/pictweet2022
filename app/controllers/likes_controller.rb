class LikesController < ApplicationController
  before_action :tweet_params

  def create
    Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    # like = current_user.likes.find_by(tweet_id: params[:tweet_id])でも良い
    like.destroy
  end

  def tweet_params
    @tweet = Tweet.find(params[:tweet_id])
  end
end