json.reservations do
  json.partial! 'v1/reservations/reservation', collection: @reservations, as: :reservation
end
