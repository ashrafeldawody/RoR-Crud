class PostsController < ApplicationController
  before_action :is_logged_in?

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @author = User.where(:id => @post.user_id).first
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render :new
    end

  end

  def update
    @post = Post.find(params[:id])
    if @post.update!(:title => params[:post][:title], :description => params[:post][:description])
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @dog = Post.find(params[:id])
    @dog.destroy
  end
  private

  def post_params
    params.permit(:title,:description)
  end
end
