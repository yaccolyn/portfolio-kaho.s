class PostsController < ApplicationController
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
end
