class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = ListUsersService.new(@user).execute
    json_response(@users)
  end

  def create
    @user = CreateUserService.new(user_params).execute
    json_response(@user, :created)
  end

  def show
    json_response(@user)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :birthday_date, :email, :password_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
