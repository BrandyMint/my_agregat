class Machine < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :user, :category, :name, :location, :charge, :presence => true

  scope :active, -> {where(:active=>true)}
  scope :archive, -> {where(:active=>false)}

  before_validation :set_specification

  def set_specification
    self.specification = {} if self.specification.blank?
  end
end
