json.data reservations do |reservation|
  json.extract! reservation, :id, :hotel_name, :price, :currency, :arrival_date, :departure_date, :guest_name, :guest_email
end