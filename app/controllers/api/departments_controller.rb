# frozen_string_literal: true
class Api::DepartmentsController < ApplicationController
  include AuthConcern

  has_scope :department_or_campus_name
  has_scope :department_id
  has_scope :campus_id

  def index
    @departments = apply_scopes(Department).all
    render json: @departments, each_serializer: DepartmentSerializer, status: :ok
  end

  def show
    @department = Department.where(id: params[:id]).first
    if @department
      render json: @department, serializer: FullDepartmentSerializer, status: :ok
    else
      head :not_found
    end
  end

  def update
    @department = Department.where(id: params[:id]).first
    if @department && @department.update_attributes(map: params[:file])
      head :no_content
    else
      render json: { errors: @department.errors }, status: :unprocessable_entity
    end
  end
end
