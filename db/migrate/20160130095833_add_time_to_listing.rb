class AddTimeToListing < ActiveRecord::Migration
  def change
    add_column :listings, :time, :string
  end
end
