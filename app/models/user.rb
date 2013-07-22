class User < ActiveRecord::Base
  attr_accessor :email, :name, :salt, :fish
end
