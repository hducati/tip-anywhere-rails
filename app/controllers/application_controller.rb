# Application Controller - for now, only includes the helpers
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
end
