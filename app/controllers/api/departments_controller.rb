# frozen_string_literal: true
class Api::DepartmentsController < ApplicationController
  respond_to :json

  has_scope :department_or_campus_name
  has_scope :department_id
  has_scope :campus_id

  def index
    @departments = apply_scopes(Department).all
    respond_with @departments, each_serializer: DepartmentSerializer
  end

  def show
    @department = Department.find(params[:id])
    respond_with @department, serializer: FullDepartmentSerializer
  end

  def update
    @department = Department.find(params[:id])
    begin
      @department.update_attributes(map: params[:file])
    rescue => e
      render json: { errors: e.message }, status: :unprocessable_entity
      return
    end
    respond_with @department
  end
end
