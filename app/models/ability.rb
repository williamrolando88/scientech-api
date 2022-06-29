# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Basic authorization level
    can :read, Brand
    can :read, Line
    can :read, Product

    # Logged user authorization
    if user.present?
      can [:read, :update], User, id: user.id
    end

    # User authorization
    if user.role == 'user'

    end

    # Manager authorization
    if user.role == 'manager'
      can :manage, User
      cannot :destroy, User, user.role == 'manager'
    end 

    # Super user authorization
    if user.role == 'admin'
      can :manage, :all
      cannot :destroy, User, id: user.id
    end
  end
end
