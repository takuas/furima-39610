class OrderSendingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :order_id, :postal, :ship_from_id, :municipalities, :address, :building, :tel

  VALID_POSTAL_REGEX = /\A\d{3}-\d{4}\z/
  VALID_TEL_REGEX = /\A\d{10,11}\z/

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal,        format: { with: VALID_POSTAL_REGEX }
    validates :ship_from_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :tel,           format: { with: VALID_TEL_REGEX }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    SendingAddress.create(postal: postal, ship_from_id: ship_from_id, municipalities: municipalities, address: address, building: building, tel: tel, order_id: order.id)
  end
end