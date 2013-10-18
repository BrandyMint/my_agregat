class User < ActiveRecord::Base
  validates :phone, :uniqueness => true
  validates :phone, :name, :password, :presence => true

  before_validation :generate_password, :on => :create

  def generate_password
    require 'securerandom'
    self.password = SecureRandom.hex[0..5]
  end
end
