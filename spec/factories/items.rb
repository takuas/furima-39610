FactoryBot.define do
  factory :item do
    item_name          { Faker::Lorem.sentence }
    description        { Faker::Lorem.sentence }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    status             { Status.where.not(id: 1).sample }
    category           { Category.where.not(id: 1).sample }
    days_to_ship       { DaysToShip.where.not(id: 1).sample }
    delivery_charge    { DeliveryCharge.where.not(id: 1).sample }
    ship_from          { ShipFrom.where.not(id: 1).sample }
    association :user

    after(:build) do |item|
      image_path = Rails.root.join('public', 'images', 'sample1.png')
      item.image.attach(io: File.open(image_path), filename: 'sample1.png')
    end
  end
end
