#encoding: utf-8
require 'thor/rails'

class Users < Thor
  include Thor::Rails

  method_option :params, type: :hash, required: true
  desc "create", "create user"
  def create()
    user = User.new(options[:params])
    puts user.errors.full_messages unless user.save
  end

end
