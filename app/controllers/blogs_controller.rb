class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
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
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
