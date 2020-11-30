module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_request
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable_entity_request
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable_entity_request

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end
  end

  private

  def unprocessable_entity_request(error)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  def unauthorized_request(error)
    json(response({ message: e.message }, :unauthorized_request))
  end
end