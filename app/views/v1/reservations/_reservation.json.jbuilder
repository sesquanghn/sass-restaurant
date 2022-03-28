json.id reservation.id
json.type "reservation"
json.attributes reservation.attributes

json.relationships do
  json.table do
    json.partial! 'v1/tables/table', table: reservation.table
  end

  json.customer do
    json.partial! 'v1/customers/customer', customer: reservation.customer
  end
end
