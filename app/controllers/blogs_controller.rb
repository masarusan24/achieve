class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_login, only: [:new, :show, :edit, :destroy]
  before_action :redirect_to_blogs_path, only: [:edit, :destroy]

  def new
    if params[:back]
      @blog = current_user.blogs.build(blog_params)
    else
      @blog = current_user.blogs.build
    end
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    @blog.image.retrieve_from_cache! params[:cache][:image]
    if @blog.save
      ContactMailer::create_blog_mail(@blog).deliver
      redirect_to blogs_path, flash: { success: 'ブログを作成しました！' }
    else
      render :new
    end
  end

  def index
    @blogs = Blog.index
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, flash: { danger: 'ブログを削除しました' }
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def confirm
    @blog = current_user.blogs.new(blog_params)
    render :new if @blog.invalid?
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, flash: { info: 'ブログを編集しました' }
    else
      render :edit
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def redirect_to_login
    unless logged_in?
      redirect_to new_session_path, flash: { warning: 'ログインしてください' }
    end
  end

  def redirect_to_blogs_path
    redirect_to blogs_path unless @blog.user_id == current_user.id
  end
end
