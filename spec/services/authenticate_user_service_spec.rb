# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticateUserService do
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

  let(:user) { create(:user) }

  let(:valid_auth_obj) { described_class.new(user.email, user.password) }

  describe '#execute' do
    context 'when valid credentials' do
      it 'return an auth token and a user object' do
        token = valid_auth_obj.execute
        expect(token).not_to be_nil
      end
    end

    context 'when invalid request' do
      it 'raises an authentication error' do
        expect { invalid_auth_obj.execute }
          .to raise_error(
            ExceptionHandler::AuthenticationError,
            Message.error_message('Wrong password/email combination')
          )
      end
    end
  end
end