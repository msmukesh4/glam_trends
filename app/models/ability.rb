class Ability
  include CanCan::Ability

  def initialize(user)
    puts "=============================================================="
    puts "             START ABILITY"
    puts "=============================================================="
    user ||= User.new

    alias_action :show, :to => :read
    # combining CRUD properties
    alias_action :create, :read, :update, :destroy, :to => :crud


    if user.is_super_user?
        can :manage, :all
    elsif user.is_owner?
        can :manage, Spa, user_id => user.id
        can :manage, Gym, user_id => user.id
        can :manage, Salon, user_id => user.id
        can :manage, SportCentre, user_id => user.id
    end
    can :manage, :all
        
    puts "=============================================================="
    puts "             END ABILITY"
    puts "=============================================================="

  end
end
