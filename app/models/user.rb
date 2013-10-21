class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable
  include Authority::UserAbilities

  phony_normalize :phone, :country_code=>'RU'
  validates_plausible_phone :phone, :country_code=>'7'
  validates :phone, :uniqueness => true
  validates :phone, :name, :presence => true

  before_validation :generate_password, :on => :create
  after_create :send_password
  has_many :machines

  def generate_password forced = false
    require 'securerandom'
    self.password = SecureRandom.hex[0..5] if password.blank? or forced
  end

  def send_password
    puts 'I DO SEND PASSWORD'
    puts password
    update_column(:sms_sended_at, Time.now)
  end

  def send_reset_password_instructions
    generate_password(true)
    send_password
    self.save
  end
end
