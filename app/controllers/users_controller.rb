class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to user_path(@user.name), flash: { success: 'ユーザを作成しました' }
    else
      render :new
    end
  end

  def show
    @user = User.find_by(name: params[:name])
    @favorite_blogs = @user.favorite_blogs
  end

  def index
    @users = User.index
  end

  def destroy
    @user = User.find(params[:name])
    @user.destroy
    redirect_to users_path, flash: { danger: 'ユーザを削除しました' }
  end

  private
  def user_param
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
