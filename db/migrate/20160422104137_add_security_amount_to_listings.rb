class AddSecurityAmountToListings < ActiveRecord::Migration
  def change
    add_column :listings, :security_amount, :string
  end
end
