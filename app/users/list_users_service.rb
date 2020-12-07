# frozen_string_literal: true

# Service responsible to list the users, except the current one
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
