class ListUsersService
  def initialize(user)
    @user = user
  end

  def execute()
    list_users
  end

  private

  def list_users()
    users = User.where.not(id: @user)

    return users
  end
end