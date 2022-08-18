# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
      if user.has_role?(:admin)
        can :manage, :all
      else
        can :manage, User, id: user.id
        can :manage, Author, user_id: user.id
        can :manage, Biblioentry, user_id: user.id
        can :manage, Book, user_id: user.id
        can :manage, Epoch, user_id: user.id
        can :manage, EventType, user_id: user.id
        can :manage, Footnote, user_id: user.id
        can :manage, GlossaryTerm, user_id: user.id
        can :manage, HoloceneEvent, user_id: user.id
        can :manage, Region, user_id: user.id
        can :manage, Section, user_id: user.id
        can :manage, Timeline, user_id: user.id

        can :read, :all
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
