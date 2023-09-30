class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category, user_id: user.id
    can :read, Entity, user_id: user.id
    can :destroy, Category, user_id: user.id
    can :destroy, Entity, user_id: user.id
    can :manage, Category, user_id: user.id
  end
end
