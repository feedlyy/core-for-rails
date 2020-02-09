class UserController < ApplicationController
  def index
    @users = User.all

    render json: @users, status: :ok
  end

  def create
    @user = User.new(user_param)
    if @user.save
      render json: ['Data Created', @user], status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    @user = User.where(id: params[:id]).first
    if @user
      render json: @user, status: :ok
    else
      render json: {message: 'wrong id'}, status: :not_found
    end
  end

  def update
    @user = User.where(id: params[:id]).first
    @user.update(user_param)
    if @user.save
      render json: ['Data Updated', @user], status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.where(id: params[:id]).first

    if @user.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
      render json: {message: 'wrong id'}, status: :unprocessable_entity
    end
  end

  private

  def user_param
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
