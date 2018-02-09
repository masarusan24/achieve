class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      flash[:success] = 'ユーザを作成しました'
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = 'ユーザを削除しました'
    redirect_to users_path
  end

  private
  def user_param
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
