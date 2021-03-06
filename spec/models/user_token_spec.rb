# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserToken, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:token) }
end
