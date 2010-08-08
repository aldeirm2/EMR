class Ability
  
  include CanCan::Ability
  
  def initialize(user)
 #if user is admin he can do anything from read, write, and create etc
    if user.admin?
      can :manage, :all
    elsif !user.admin?
      #insert code here to modify how we want non admin users to act
    end
  end
  
end