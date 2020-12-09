require 'rails_helper'

RSpec.describe Tip, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:odd) }
  it { is_expected.to validate_presence_of(:tip) }
  it { is_expected.to validate_presence_of(:game) }
  it { is_expected.to validate_presence_of(:unit) }
end
