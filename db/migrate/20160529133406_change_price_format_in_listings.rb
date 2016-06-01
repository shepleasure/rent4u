class ChangePriceFormatInListings < ActiveRecord::Migration
  def change
  	change_column :listings, :price, 'integer USING CAST(price AS integer)'
  end
end
