class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  VALID_PRICE_REGEX = /\A\d+\Z/

  with_options presence: true do
    validates :item_name
    validates :description
    validates :user
    validates :image
    validates :price, inclusion: 300..9_999_999, format: { with: VALID_PRICE_REGEX }
    validates :category_id,        numericality: { other_than: 1 , message: "can't be blank" }
    validates :status_id,          numericality: { other_than: 1 , message: "can't be blank" }
    validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :ship_from_id,       numericality: { other_than: 1 , message: "can't be blank" }
    validates :days_to_ship_id,    numericality: { other_than: 1 , message: "can't be blank" }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship, class_name: 'DaysToShip'
  belongs_to :delivery_charge, class_name: 'DeliveryCharge'
  belongs_to :ship_from, class_name: 'ShipFrom'
  belongs_to :status

end
