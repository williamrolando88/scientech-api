# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Basic authorization level
    can :read, Brand
    can :read, Line
    can :read, Product

    # Logged user authorization
    return unless user.present?

    can [:read, :update], User, id: user.id

    # Admin authorization
    return unless user.role == 'admin'

    can :manage, User
    cannot :manage, User, user.role == 'super_user'

    # Super user authorization
    return unless user.role == 'super_user'

    can :manage, :all
    cannot :delete, User, user.role == 'super_user'
  end
end
