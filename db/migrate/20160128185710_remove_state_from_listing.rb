class RemoveStateFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :state, :string
  end
end
