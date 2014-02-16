class Admin::PostsController < ApplicationController

  before_filter :authenticate_admin!
  layout 'administration'

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permitted_params)
    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(permitted_params)
      redirect_to admin_posts_path
    else
      render :show
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :text, :publish, :preface)
  end
end
