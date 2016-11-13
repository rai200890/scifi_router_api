# frozen_string_literal: true
require 'rails_helper'
RSpec.describe Api::SessionsController, type: :controller do
  describe '#create' do
    let(:valid_credentials) { { username: 'john_doe', password: 'pass' } }
    let(:invalid_credentials) { { username: 'john_doe', password: 'pas' } }
    before(:each) do
      allow(ENV).to receive(:[]).with('JWT_SECRET_KEY').and_return('secret')
      allow(ENV).to receive(:[]).with('JWT_ALGORITHM').and_return('HS256')
      allow(ENV).to receive(:[]).with('JWT_EXPIRATION_TIME').and_return('300')
      User.create(username: 'john_doe', email: 'john_doe@email.com', password: 'pass', password_confirmation: 'pass')
    end
    describe 'given valid credentials' do
      it 'should return generated token' do
        response = post :create, params: { session: valid_credentials }
        body = JSON.parse(response.body)
        expect(body['access_token']).not_to be(nil)
      end
    end
    describe 'given invalid credentials' do
      it 'should return unauthorized status' do
        response = post :create, params: { session: invalid_credentials }
        expect(response.status).to be(401)
      end
    end
    describe 'user does not exist' do
      it 'should return unauthorized status' do
        response = post :create, params: { session: { username: 'john', password: 'pas' } }
        expect(response.status).to be(401)
      end
    end
  end
end
