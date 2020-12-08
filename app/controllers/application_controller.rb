# frozen_string_literal: true

# Application Controller - for now, only includes the helpers
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    @current_user = (AuthorizeApiRequest.execute(request.headers))[:user]
  end
end
