class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.integer :user_id
        t.integer :listing_id
        t.integer :duration
        t.integer :accommodates
    end
  end
end
