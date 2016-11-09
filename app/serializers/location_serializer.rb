# frozen_string_literal: true
class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :department_name, :campus_name
end
