class PostsController < ApplicationController
  before_action :private_access, except: [:index, :show]

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "Post created successfully"
    else
      render :new  
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post edit successfully"
    else
      render :edit
    end       
  end 

  def destroy 
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice:"Post deleted successfully"
  end


  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
end
