class Item < ApplicationRecord

  has_one_attached :image

  has_many :cart_items, dependent: :destory
  has_many :order_details, dependent: :destroy
  belongs_to :genre

end
