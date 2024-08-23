class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    redirect_to posts_path, success: 'お気に入りに登録できました'
  end

  def destroy
    post = current_user.favorites.find(params[:id]).post
    current_user.unfavorite(post)
    redirect_to posts_path, success: 'お気に入り登録を解除しました', status: :see_other
  end
end
