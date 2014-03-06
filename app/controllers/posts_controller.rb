class PostsController < ApplicationController

  before_filter :load_random_comedies

  def index
    @posts = Post.publicable.page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
  end
end
