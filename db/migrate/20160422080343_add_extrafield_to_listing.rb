class AddExtrafieldToListing < ActiveRecord::Migration
  def change
  	add_column :listings, :security, :string
  	add_column :listings, :terms, :text
  	add_column :listings, :delivery, :string
  end
end
