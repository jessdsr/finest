class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # Uncomment this 'resolve' action to see all the index of listings
    # In another situation we would have return the index w/ Listings.all
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user || user.admin?
  end

  def destroy?
    record.user == user || user.admin?
  end
end
