# frozen_string_literal: true

# Exception Handler to deal with custom exceptions
module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end

  class MissingToken < StandardError; end

  class InvalidToken < StandardError; end

  class EmailExists < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_request
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable_entity_request
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable_entity_request
    rescue_from ExceptionHandler::EmailExists, with: :unprocessable_entity

    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ message: error.message }, :not_found)
    end
  end

  private

  def unprocessable_entity_request(error)
    json_response({ message: error.message }, :unprocessable_entity)
  end

  def unauthorized_request(error)
    json_response({ message: error.message }, :unauthorized)
  end
end
