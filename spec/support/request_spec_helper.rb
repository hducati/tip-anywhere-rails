# frozen_string_literal: true

module RequestSpecHelper
  def json_parse
    JSON.parse(response.body)
  end
end
