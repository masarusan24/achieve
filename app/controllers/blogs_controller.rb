class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_login, only: [:new, :show, :edit, :destroy]
  before_action :authorize_action, only: [:edit, :destroy]

  def new
    if params[:back]
      @blog = current_user.blogs.build(blog_params)
    else
      @blog = current_user.blogs.build
    end
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    @blog.image.retrieve_from_cache! params[:cache][:image] unless params[:cache].nil?
    if @blog.save
      ContactMailer::create_blog_mail(@blog).deliver
      redirect_to blogs_path, flash: { success: t('.success') }
    else
      render :new
    end
  end

  def index
    @blogs = Blog.index
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, flash: { danger: t('.success') }
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    @comment = @blog.comments.build
    @comments = @blog.comments
  end

  def edit
  end

  def confirm
    @blog = current_user.blogs.new(blog_params)
    render :new if @blog.invalid?
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, flash: { info: t('.success') }
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
      redirect_to new_session_path, flash: { warning: t(:please_login) }
    end
  end

  def authorize_action
    authorize! @blog
  end
end
