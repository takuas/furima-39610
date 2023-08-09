class SendingAddress < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :ship_from, class_name: 'ShipFrom'
end
