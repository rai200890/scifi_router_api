# frozen_string_literal: true
class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :department_name, :department_id, :campus_name
end
