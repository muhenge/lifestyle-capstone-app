class Category < ApplicationRecord
  has_many :articles
  scope :order_by_priority, -> { order(priority: :desc) }

end
