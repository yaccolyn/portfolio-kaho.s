class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: 'ポストに成功しました'
    else
      flash.now[:danger] = 'ポストに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:store_name, :content)
  end
end
#picture,tag,comment,location_informationも随時permitに加える