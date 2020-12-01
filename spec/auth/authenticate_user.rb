require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }

  subject(:valid_auth_obj) { described_class.new(user.email, user.password) }
  subject(:invalid_auth_obj) { described_class.new('foo', 'bar') }

  describe '#execute' do
    context 'when valid credentials' do
      it'return an auth token and a user object' do
        [user_obj, token] = valid_auth_obj.execute
        expect(token).not_to be_nil
        expect(user_obj).not_to be_nil
      end
    end

    context 'when invalid request' do
      it 'raises an authentication error' do
        expect { invalid_auth_obj.execute }
          .to raise_error(  
            ExceptionHandler::AuthenticationError,
            /Invalid credentials/
          )
      end
    end
  end
end