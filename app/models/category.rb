
class Category < ApplicationRecord
  has_many :articles
  has_one_attached :image
  def self.priority
    Category.order_by_priority.includes(:articles).limit(10)
  end
  scope :order_by_priority, -> { order(priority: :desc) }
end
