class TweetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  def index
    @tweets= Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @category_list = Category.all
  end

  def new
  end

  def create
    # 選択から選んだカテゴリー
    if params[:category_ids]
      collection_category_list = Category.where(id: params[:category_ids]).map(&:category_name)
      category_list = collection_category_list + params[:category_names].split(",")
    else
      category_list = params[:category_names].split(",")
    end
    # category_list = tweet_params[:category_names].split(",")
    category_list_uniq = category_list.uniq
    @tweet = Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
    @tweet.save_category(category_list_uniq)
    # binding.pry
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
  end

  def edit
    @tweet = Tweet.find(params[:id])
    @category_list = @tweet.categories.pluck(:category_name).join(',')
  end

  def update
    tweet = Tweet.find(params[:id])
    if params[:category_ids]
      collection_category_list = Category.where(id: params[:category_ids]).map(&:category_name)
      category_list = collection_category_list + params[:category_names].split(",")
    else
      category_list = params[:category_names].split(",")
    end
    category_list_uniq = category_list.uniq
    if tweet.user_id == current_user.id
      #こうしないと⬇︎、categoryに関するパラメータをpermitしてくれない
      tweet.update(image: tweet_params[:image], text: tweet_params[:text])
      tweet.save_category(category_list_uniq)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end

  def search
    @category_list = Category.all
    @category = Category.find(params[:category_id])
    @tweets = @category.tweets.all.page(params[:page]).per(5).order("created_at DESC")
  end

  private
    def tweet_params
      params.permit(:image, :text)
    end

  def move_to_index
    redirect_to action: :index unless user_signed_in? #user_signed_inメソッドは、deviseのメソッド
  end
end