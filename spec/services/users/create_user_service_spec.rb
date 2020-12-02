require 'rails_helper'

RSpec.describe CreateUserService do
  let(:user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }

  subject(:valid_object) { described_class.new(
    user.name, user.birthday_date, user.email, user.password_digest) }
    
  subject(:invalid_object) { described_class.new(
    'foo', 'bar', 'foo', 'bar') }

  describe '#execute' do
    context 'when valid request' do
      it 'should be able to create a user ' do
        user_object = valid_object.execute
        expect(user_object).not_to be_nil
      end
    end

    context 'when invalid request' do
      it 'should not be able to create a user with a existing email address' do
        user_object_1 = valid_object.execute
        user_object_2 = valid_object.execute

        expect(user_object_2).to raise_error(
          ExceptionHandler::RecordInvalid, 
          AppError.error_message('Email address already used'))
      end
    end
  end
end