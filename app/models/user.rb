class User < ApplicationRecord
    acts_as_voter
    has_many :articles, class_name: 'Article', foreign_key: 'authorid'
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
