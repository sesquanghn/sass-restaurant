module Reservations
  class CreateReservationForm < BaseReservationForm
    def submit
      validate!
      Reservation.create!(attributes)
    end
  end
end
