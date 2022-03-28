module Reservations
  class UpdateReservationForm < BaseReservationForm
    def submit
      validate!
      Reservation.find(id).tap { |reservation| reservation.update!(attributes) }
    end
  end
end
