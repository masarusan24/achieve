class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_login, only: [:new, :show, :edit, :destroy]
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
      @blog.user_id = current_user.id
    end
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      flash[:success] = 'ブログを作成しました！'
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def index
    @blogs = Blog.all
  end

  def destroy
    @blog.destroy
    flash[:danger] = 'ブログを削除しました'
    redirect_to blogs_path
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def confirm
    @blog = Blog.new(blog_params)
    render 'new' if @blog.invalid?
  end

  def update
    if @blog.update(blog_params)
      flash[:info] = 'ブログを編集しました'
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def redirect_to_login
    unless logged_in?
      flash[:warning] = 'ログインしてください'
      redirect_to new_session_path
    end
  end
end
