class CreateUserService
  def initialize(params={})
    @user_params = params
  end

  def execute
    create_user
  end

  private

  def create_user
    userExists = User.find_by(email: @user_params[:email])

    if userExists
      raise(
        ExceptionHandler::RecordInvalid, 
        AppError.error_message('Email address already used')
      )
    end

    user = User.create!(@user_params)

    return user
  end
end