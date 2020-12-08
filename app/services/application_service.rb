# frozen_string_literal: true

# Main service responsible to call a service with the given params
class ApplicationService
  def self.execute(*args, &block)
    new(*args, &block).execute
  end
end
