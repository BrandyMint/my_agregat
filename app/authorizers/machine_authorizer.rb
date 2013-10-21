class MachineAuthorizer < ApplicationAuthorizer
  def self.readable_by?(user, owner)
    user.id == owner.id
  end

  def updatable_by?(user)
    resource.user == user
  end

  def createable_by?(user)
    resource.user == user
  end

end