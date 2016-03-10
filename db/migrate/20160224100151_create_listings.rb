class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.string :city
      t.string :property_type
      t.string :room_type
      t.integer :accommodates
      t.integer :bedrooms
      t.integer :beds
      t.integer :bathrooms
      t.integer :price
      t.integer :user_id
   end
 end
end
