class User < ApplicationRecord
  acts_as_voter
  validates :name, presence: true
  has_many :articles, class_name: 'Article', foreign_key: 'authorid'

  def most_recent
    User.ordered_by_most_recent.include(:articles).limit(5)
  end
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
