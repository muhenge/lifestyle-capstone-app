class Category < ApplicationRecord
  has_many :articles
  has_one_attached :image

  scope :order_by_priority, -> { order(priority: :desc) }
  scope :ordered_priority, -> { order(priority: :desc) }

end
