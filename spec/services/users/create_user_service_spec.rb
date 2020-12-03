require 'rails_helper'

RSpec.describe CreateUserService do
  let(:user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }

  let(:valid_attributes) do
    attributes_for(:user)
  end

  subject(:valid_object) { described_class.new(valid_attributes) }

  describe '#execute' do
    context 'when valid request' do

      it 'should be able to create a user ' do
        newUser = valid_object.execute
        expect(newUser[:name]).to eq(valid_attributes[:name])
        expect(newUser[:birthday_date]).to eq(valid_attributes[:birthday_date])
        expect(newUser[:email]).to eq(valid_attributes[:email])
        expect(newUser[:password_digest]).to eq(valid_attributes[:password_digest])
      end
    end

    context 'when invalid request' do
      it 'should not be able to create a user with a existing email address' do
        checkUser = valid_object.execute
        expect { valid_object.execute }.to raise_error(
          ActiveRecord::RecordInvalid
        )
      end
      
      context 'when invalid user' do
        let(:valid_attributes_2) do
          attributes_for(:user)
        end
        let(:valid_object_2) { described_class.new(valid_attributes_2)}

        it 'should be equal' do
          checkUser = valid_object.execute
          newUser = valid_object_2.execute
  
          expect(checkUser).not_to eq(newUser)
        end
      end
     
    end
  end
end