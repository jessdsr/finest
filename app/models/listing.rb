class Listing < ApplicationRecord
  belongs_to :user

  validates :style, :category, :description, :price_per_day, :city, presence: true

  enum style: {
    traditional: 0,
    modern: 1,
    contemporary: 2,
    minimalist: 3,
    arts_deco: 4,
    industrial: 5,
    scandinavian: 6,
    rustic: 7,
    bohemian: 8
  }

  enum category: {
    chairs: 0,
    tables: 1,
    sofas: 2,
    lighting: 3,
    beds: 4,
    decor: 5,
    storage: 6
  }
end
