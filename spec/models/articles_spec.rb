require 'rails_helper.rb'

RSpec.describe Article, type: :model do
  context 'Article content' do
    it "title can't be nil"  do
      article = Article.new(title:nil)
      article.valid?
      expect(article.errors[:title][0]).to include("can't be blank")
    end
    it "text can't be nil" do
      article = Article.new(text: nil)
      article.valid?  
      expect(article.errors[:text][0]).to include("can't be blank")
    end
  end
  context 'is associated to' do
    describe Article do
      it { should belong_to(:category) }
      it { should belong_to(:author) }
    end
  end

end
