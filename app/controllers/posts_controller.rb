class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
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

  def edit
    @post = current_user.posts.find(params[:id])

    unless current_user && current_user.own?(@post)
      flash[:danger] = '編集できません'
      redirect_to posts_path
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), success: '編集できました'
    else
      flash.now[:danger] = '編集できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:store_name, :content, { images: [] })
  end
end
#picture,tag,comment,location_informationも随時permitに加える