# frozen_string_literal: true
class Api::UsersController < ApplicationController
  include AuthConcern

  def index
    @users = apply_scopes(User).all
    render json: @users, each_serializer: UserSerializer, status: :ok
  end

  def show
    @user = User.where(id: params[:id]).first
    if @user
      render json: @user, serializer: UserSerializer, status: :ok
    else
      head :not_found
    end
  end

end
