class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @create = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @create = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end