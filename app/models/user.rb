class User < ApplicationRecord
    has_many :articles, class_name: 'Article', foreign_key: 'authorid'
end
