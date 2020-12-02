class CreateUserService
  def initialize(name, birthday_date, email, password_digest)
    @name = name
    @birthday_date = birthday_date
    @email = email
    @password_digest = password_digest
  end

  def execute
    create_user
  end

  attr_reader :name, :birthday_date, :email, :password_digest

  private

  def create_user
    userExists = User.find_by(email: email)

    puts(userExists)

    user = User.create!({
      name: name, birthday_date: birthday_date, email: email, 
      password_digest: password_digest})

    return user if userExists && user

    raise(
      ExceptionHandler::RecordInvalid, 
      AppError.error_message('Email address already used')
    )
  end

end