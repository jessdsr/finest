class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.integer :type, null: false
      t.integer :style, null: false
      t.text :description
      t.boolean :deliverable, default: false
      t.integer :price_per_day, null: false
      t.string :city, null: false
      t.text :product_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
