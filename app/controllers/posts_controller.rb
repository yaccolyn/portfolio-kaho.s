class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
    @favorites = current_user.favorites.includes(:post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      # 位置情報が設定されている場合、location_informationを作成または取得
      if params[:post][:address].present?
        location_info = LocationInformation.find_or_create_by(address: params[:post][:address])
        @post.update(location_information: location_info)
      end
      
      # 画像の保存やタグの処理はここに追加することも可能
  
      redirect_to posts_path(@post), success: 'ポストを作成しました'
    else
      flash.now[:danger] = 'ポストを作成できませんでした'
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
    @address = @post.location_information&.address

    unless current_user && current_user.own?(@post)
      flash[:danger] = '編集できません'
      redirect_to posts_path
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      # 位置情報の処理
      if params[:post][:address].present?
        location_info = LocationInformation.find_or_create_by(address: params[:post][:address])
        @post.update(location_information: location_info)
      end
      redirect_to post_path(@post), success: '編集できました'
    else
      @address = params[:post][:address]
      flash.now[:danger] = '編集できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: '削除できました', status: :see_other
  end

  def favorites
    @favorite_posts = current_user.favorite_posts.includes(:user)
  end

  private

  def post_params
    params.require(:post).permit(:store_name, :content, { images: [] })
  end
end
#picture,tag,comment,location_informationも随時permitに加える
