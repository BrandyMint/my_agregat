class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable
  validates :phone, :uniqueness => true
  validates :phone, :name, :password, :presence => true

  before_validation :generate_password, :on => :create

  def generate_password
    require 'securerandom'
    self.password = SecureRandom.hex[0..5] if password.blank?
  end
end
