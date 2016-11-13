# frozen_string_literal: true
class Api::SessionsController < ApplicationController
  def create
    user = User.where(username: session_params[:username]).first
    if user && user.authenticate(session_params[:password])
      token = Auth.generate_token(user: user.id)
      render json: { access_token: token }, status: :created
    else
      head :unauthorized, content_type: 'application/json'
    end
   end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
