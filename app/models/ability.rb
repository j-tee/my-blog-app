class Ability
  include CanCan::Ability
  def initialize(member)
    can :delete, Post do |post|
      post.user.member_id == member.id || member.admin?
    end
    can :delete, Comment do |comment|
      comment.user.member == member || member.admin?
    end
  end
end
