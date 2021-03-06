class Article < ApplicationRecord
  acts_as_votable
  validates :title, presence: true
  validates :text, presence: true
  has_one_attached :image
  validates_presence_of :category_id
  belongs_to :author, class_name: 'User', foreign_key: 'authorid'
  belongs_to :category
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :most_voted, -> { Article.all.pluck(:cached_votes_up).max }
end
