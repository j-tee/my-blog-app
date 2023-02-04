class Ability
  include CanCan::Ability
  def initialize(member)
    can :delete, Post do |post|
      post&.user&.member_id == member&.id || member&.try(:admin?)
    end
    can :delete, Comment do |comment|
      comment&.user&.member_id == member&.id || member&.try(:admin?)
    end
  end
end
