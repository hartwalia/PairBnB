class ChangePaidDefaultInReservations < ActiveRecord::Migration
  def change
  	change_column :reservations, :paid, :string, :default => "pending"
  end
end
