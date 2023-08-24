class Order < ApplicationRecord
  has_one :sending_address, dependent: :destroy
  belongs_to :user
  belongs_to :item
end
