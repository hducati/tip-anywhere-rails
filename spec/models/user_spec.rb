# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:user_tokens).dependent(:destroy) }
  it { is_expected.to have_many(:tips).dependent(:destroy) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { is_expected.to validate_presence_of(:birthday_date) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password_digest) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_length_of(:phone_number).is_at_least(9).is_at_most(13) }
end
