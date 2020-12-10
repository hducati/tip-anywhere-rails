require 'rails_helper'

RSpec.describe Tip, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:odd) }
  it { is_expected.to validate_presence_of(:tip) }
  it { is_expected.to validate_presence_of(:game) }
  it { is_expected.to validate_presence_of(:unit) }
  it { is_expected.to validate_numericality_of(:odd).is_greater_than_or_equal_to(0.01) }
  it { is_expected.to validate_numericality_of(:unit).is_greater_than_or_equal_to(0.01) }
  it { is_expected.to validate_inclusion_of(:status).in_array(%w[Half Red Green Void]) }
end
