class ReservationJob
  include Sidekiq::Worker

  def perform(reservation_id)
    # Do something later
    reservation = Reservation.find(reservation_id)
    ReservationMailer.reservation_email(reservation).deliver_later
  end
  
end
