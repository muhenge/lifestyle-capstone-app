require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Post content' do
    it 'content must be present' do
      article = Article.new(content: nil)
      Article.valid?
      expect(article.errors.full_messages).to include(/Content can't be blank/)
    end
    context "User's associations" do
      describe Article do
        it { should belongs_to(:author) }
        it { should belongs_to(:category) }
      end
    end
  end
end
