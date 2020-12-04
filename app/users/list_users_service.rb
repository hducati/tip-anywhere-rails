# frozen_string_literal: true

class ListUsersService
  def initialize(user)
    @user = user
  end

  def execute
    list_users
  end

  private

  def list_users
    User.where.not(id: @user)
  end
end
