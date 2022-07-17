class Reservation
  include Mongoid::Document
  field :id, type: String
  field :hotel_name, type: String
  field :price, type: Float
  field :currency, type: String
  field :arrival_date, type: Time
  field :departure_date, type: Time
  field :guest_name, type: String
  field :guest_email, type: String
end
