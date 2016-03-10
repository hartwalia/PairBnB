class ReservationMailer < ApplicationMailer
default from: 'notifications@example.com'
 
  def reservation_email(reservation)
    @reservation = reservation
    @url  = 'http://example.com/login'
    mail(to: @reservation.user.email, subject: "PairBnB : Reservation for #{@reservation.listing.name}")
  end
end
