class Machine < ActiveRecord::Base
  include Authority::Abilities
  belongs_to :category
  belongs_to :user

  validates :user, :category, :name, :location, :charge, :presence => true

  scope :active, -> {where(:active=>true)}
  scope :archive, -> {where(:active=>false)}

  before_validation :set_specification

  def set_specification
    self.specification = {} if self.specification.blank?
  end

  def activate
    self.update_attribute(:active, true)
  end

  def archivate
    self.update_attribute(:active, false)
  end
end
