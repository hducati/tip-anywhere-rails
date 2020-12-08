# frozen_string_literal: true

# User methods - control actions of a user
class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]

  def index
    @users = User.where.not(@user)
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
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
    params.permit(:name, :email, :birthday_date,
                  :password_digest, :password_digest_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
