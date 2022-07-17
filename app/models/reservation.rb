class Reservation
  include Mongoid::Document
  field :id, type: String
  field :hotel_name, type: String
  field :price, type: Float
  field :currency, type: String
  field :arrival_date, type: Date
  field :departure_date, type: Date
  field :guest_name, type: String
  field :guest_email, type: String

  validates_presence_of :hotel_name, :price, :currency, :arrival_date, :departure_date,
                        :guest_name, :guest_email
end
