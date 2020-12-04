# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateUserService do
  subject(:valid_object) { described_class.new(valid_attributes) }

  let(:user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }

  let(:valid_attributes) do
    attributes_for(:user)
  end

  describe '#execute' do
    context 'when valid request' do
      it 'is able to create a user' do
        new_user = valid_object.execute
        expect(new_user[:name]).to eq(valid_attributes[:name])
        expect(new_user[:birthday_date]).to eq(valid_attributes[:birthday_date])
        expect(new_user[:email]).to eq(valid_attributes[:email])
        expect(new_user[:password_digest]).to eq(valid_attributes[:password_digest])
      end
    end

    context 'when invalid request' do
      it 'is not able to create a user with a existing email address' do
        check_user = valid_object.execute
        expect { valid_object.execute }.to raise_error(
          ActiveRecord::RecordInvalid
        )
      end

      context 'when invalid user' do
        let(:valid_attributes_2) do
          attributes_for(:user)
        end
        let(:valid_object_2) { described_class.new(valid_attributes_2) }

        it 'is equal' do
          check_user = valid_object.execute
          new_user = valid_object_2.execute

          expect(check_user).not_to eq(new_user)
        end
      end
    end
  end
end
