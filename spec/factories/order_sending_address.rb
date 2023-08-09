FactoryBot.define do
  factory :order_sending_address do
    postal         { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    ship_from_id   { ShipFrom.where.not(id: 1).sample.id }
    municipalities { Faker::Address.street_address }
    address        { Faker::Address.secondary_address }
    tel            { Faker::Number.unique.number(digits: 11) }
    building       { Faker::Address.building_number }
    token          { Faker::Alphanumeric.alphanumeric(number: 16) }
  end
end
