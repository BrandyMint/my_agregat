class Machine < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :category
  belongs_to :user

  validates :user, :category, :name, :location, :charge, :presence => true

  scope :active, -> {where(:active=>true)}
  scope :archive, -> {where(:active=>false)}

  before_validation :set_specification

  def set_specification
    self.specification = {} if self.specification.blank?
  end

  def to_indexed_json
    {
      :category   => category.name,
      :name => name,
      :location => location,
      :charge => charge,
      :driver_charge => driver_charge,
      :description => description,
      :specification => specification
    }.to_json
  end
end
