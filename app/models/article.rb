class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    has_one_attached :image
    belongs_to :author, class_name: 'User', foreign_key: 'authorid'
    belongs_to :category
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
    scope :article_by_author, -> { Article.find_by_authorid(1) }
end
