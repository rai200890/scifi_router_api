# frozen_string_literal: true
require 'active_support/concern'
module PaginationConcern
  extend ActiveSupport::Concern
  included do
    has_scope :page
    has_scope :per
  end
end
