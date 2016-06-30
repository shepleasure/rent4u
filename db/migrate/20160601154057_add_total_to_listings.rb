class AddTotalToListings < ActiveRecord::Migration
  def change
    add_column :listings, :total, 'integer USING CAST(total AS integer)'
  end
end
