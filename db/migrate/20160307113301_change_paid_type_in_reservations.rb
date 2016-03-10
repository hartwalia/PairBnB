class ChangePaidTypeInReservations < ActiveRecord::Migration
  def change
  	change_column :reservations, :paid, :string
  end
end
