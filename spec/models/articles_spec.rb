require 'rails_helper.rb'

RSpec.describe Article, type: :model do
  context 'Article content' do
    it "title can't be nil" do
      article = Article.new(title: nil)
      expect(article.valid?).to be false
    end
    it "text can't be nil" do
      article = Article.new(text: nil)
      expect(article.invalid?).to be true
    end
  end
  context 'is associated to' do
    describe Article do
      it { should belong_to(:category) }
      it { should belong_to(:author) }
    end
  end
end
