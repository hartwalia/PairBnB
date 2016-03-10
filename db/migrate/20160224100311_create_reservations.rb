class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.integer :duration
      t.date :check_in
      t.date :check_out
      t.integer :total_cost
    end
  end
end
