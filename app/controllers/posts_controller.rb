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

    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end

    @post.save
  end

  def show
    @post = Post.find(params[:id])

  end

  def edit
    @post = Post.find(:id)
  end

  def update
    @post = Post.find(:id)
    if @post.update(post_params) # TODO: handle validation failed!
      flash[:notice] = "成功送出留言！"
      redirect_to posts_path
    else
      flash[:alert] = "所有欄位不得為空白！"
    end
  end

  def destroy
    @post.destroy

    flash[:alert] = "Post was deleted"
    redirect_to posts_path

    respond_to do |format|
      format.html {redirect_to posts_path}
      format.js
    end
  end




private


  def post_params
    params.require(:post).permit(:title, :content, :name, :email)
  end





end
