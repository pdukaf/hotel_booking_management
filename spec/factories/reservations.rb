FactoryBot.define do
  factory :reservation do
    hotel_name { FFaker::Name.name}
    price { FFaker::Name.name}
    currency { FFaker::Currency.name}
    arrival_date { FFaker::IdentificationESCO.expedition_date}
    departure_date { FFaker::IdentificationESCO.expedition_date}
    guest_name { FFaker::Name.name}
    guest_email {200.00}
  end
end