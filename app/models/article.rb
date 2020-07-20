class Article < ApplicationRecord
    validates :title, presence: true
    validates :text, presence: true
    has_one_attached :image
    belongs_to :author, class_name: 'User', foreign_key: 'authorid'

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }

end
