# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Api::ApsController, type: :request do
  let(:ap) { FactoryGirl.create(:ap) }
  let(:valid_token) do
    allow(ENV).to receive(:[]).with('JWT_SECRET_KEY').and_return('secret')
    allow(ENV).to receive(:[]).with('JWT_ALGORITHM').and_return('HS256')
    allow(ENV).to receive(:[]).with('JWT_EXPIRATION_TIME').and_return('300')
    user = User.create(username: 'john_doe', email: 'john_doe@email.com', password: 'pass', password_confirmation: 'pass')
    Auth.generate_token(user: user.id)
  end
  describe '#index' do
    describe 'with valid token' do
      describe 'existing ap' do
        let!(:aps) { FactoryGirl.create_list(:ap, 2) }
        context 'given no filter' do
          it 'should return the ap' do
            get '/api/aps', headers: { "Authorization": "Bearer #{valid_token}" }
            body = JSON.parse(response.body)
            expect(response.status).to be(200)
          end
        end
      end
      describe 'without token' do
        it 'should return the ap' do
          get '/api/aps'
          expect(response.status).to be(401)
        end
      end
    end
  end
  describe '#show' do
    describe 'with valid token' do
      describe 'existing ap' do
        it 'should return the ap' do
          get "/api/aps/#{ap.id}", headers: { "Authorization": "Bearer #{valid_token}" }
          body = JSON.parse(response.body)
          expect(response.status).to be(200)
        end
      end
      describe 'ap does not exist' do
        it 'should return the ap' do
          get '/api/aps/0', headers: { "Authorization": "Bearer #{valid_token}" }
          expect(response.status).to be(404)
        end
      end
    end
  end
  describe '#update' do
    describe 'with valid token' do
      describe 'given valid user token' do
        describe 'given valid params' do
          it 'should return new ap success status' do
            put "/api/aps/#{ap.id}", params: { ap: { map_latitude: -1.0, map_longitude: 1.0 } }, headers: { "Authorization": "Bearer #{valid_token}" }
            ap.reload
            expect(response.status).to be(204)
            expect(ap.map_latitude).to eq(-1.0)
            expect(ap.map_longitude).to eq(1.0)
          end
        end
      end
    end
  end
end
