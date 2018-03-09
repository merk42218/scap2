class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    if user
      if user.has_role?('admin')
        can :create,             :all
        can :edit,               :all
        can :destroy,            :all
        can :update,             :all
        can :index,              :all
        can :show,              :all
        can :gra2,               :all
        can :gra1,               :all
        # can :show2,               WelcomeController
      end
      if user.has_role?('operator')
        can :index,              :all
        can :show,              :all
        can :create,             [Address, Person, CharacteristicValue, Characteristic, InformationSystem, PartOfCharacteristic, Weight]
        can :edit,               [Address, Person, CharacteristicValue, Characteristic, InformationSystem, PartOfCharacteristic, Weight]
        can :destroy,            [Address, Person, CharacteristicValue, Characteristic, InformationSystem, PartOfCharacteristic, Weight]
        can :update,             [Address, Person, CharacteristicValue, Characteristic, InformationSystem, PartOfCharacteristic, Weight]
        can :gra2,               :all
        can :gra1,               :all
      end
      if user.has_role?('user')
        can :gra1,               :all
        can :gra2,               :all

      end
    else
      # can :index           []
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
