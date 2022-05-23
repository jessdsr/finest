class ChangeTypeNameToListing < ActiveRecord::Migration[7.0]
  def change
    rename_column :listings, :type, :category
    change_column :listings, :category, :integer, default: 0
  end
end
