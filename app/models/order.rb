class Order < ApplicationRecord
  has_one :sending_address
  belongs_to :user
  belongs_to :item
end
