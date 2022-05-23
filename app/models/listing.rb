class Listing < ApplicationRecord
  belongs_to :user

  validates :type, :style, :description, :type, :price_per_day, :city, presence: true

  enum style: {
    traditional: 0,
    modern: 1,
    contemporary: 2,
    minimalist: 3
  }
end
