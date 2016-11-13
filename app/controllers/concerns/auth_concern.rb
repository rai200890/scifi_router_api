# frozen_string_literal: true
require 'active_support/concern'
module AuthConcern
  extend ActiveSupport::Concern
  included do
    before_action :authenticate

    def current_user
      @current_user = User.where(id: decoded_token['user']).first if token
    end

    def authenticate
      render json: { errors: ['User cannot access this resource'] }, status: 401 unless current_user
    rescue JWT::ExpiredSignature
      render json: { errors: ['Token is expired'] }, status: 419
    end

     private

    def token
      auth_header = request.headers['HTTP_AUTHORIZATION']
      auth_header.scan(/Bearer (.*)$/).flatten.last if auth_header
    end

    def decoded_token
      Auth.decode_token(token)
    end
  end
end
