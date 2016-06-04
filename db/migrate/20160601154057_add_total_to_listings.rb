class AddTotalToListings < ActiveRecord::Migration
  def change
    add_column :listings, :total, :integer
  end
end
