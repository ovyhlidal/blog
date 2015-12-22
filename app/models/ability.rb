class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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


      user ||= User.new
      # Define User abilities
      if user.abili :super_admin
        can :manage, :all
      elsif user.role? :user
        can :read, Article
        # manage products, assets he owns
        can :manage, Article do |article|
          article.try(:owner) == user
        end

     # else
     #   can :manage, Article, :user_id => user.id
     #   can :read, Article
     # end


      end
  end

  # convinience method for format of role
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def initialize user, options = {}
    user ? user_rules : guest_user_rules
  end

  def user_rules
    user.roles.each do |role|
      exec_role_rules(role) if user.roles.include? role
    end
    default_rules
  end

  def exec_role_rules role
    meth = :"#{role}_rules"
    send(meth) if respond_to? meth
  end



  # various rules methods for each role
  def admin_rules
    can :manage, :all
  end

  def editor_rules
    can :manage, [Article]
  end

  def default_rules
    can :read, :all
  end

end
