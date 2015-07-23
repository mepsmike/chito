class PostsController < ApplicationController

  # TODO: authorization for index action

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
  end

private


  def post_params
    params.require(:post).permit(:title, :content, :name, :email)
  end





end
