class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # Uncomment this 'resolve' action to see all the index of listings
    # In another situation we would have return the index w/ Listings.all
    def resolve
      scope.all
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
end
