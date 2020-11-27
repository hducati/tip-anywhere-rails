require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_tokens).dependent(:destroy)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:birthday_date) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
