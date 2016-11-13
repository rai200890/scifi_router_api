# frozen_string_literal: true
class Api::CampiController < ApplicationController
  include AuthConcern
  has_scope :campus_name

  def index
    @campi = apply_scopes(Campus).all
    render json: @campi, status: :ok
  end
end
