class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blog_url(id: params[:blog_id]),
      flash: { info: "#{favorite.blog.user.name}さんのブログをお気に入りに登録しました" }
  end

  def destroy
    favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
    redirect_to blog_url(id: params[:blog_id]), 
      flash: { warning: "#{favorite.blog.user.name}さんのブログお気に入りを解除しました" }
  end

end
