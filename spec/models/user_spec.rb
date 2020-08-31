require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    describe User do
      it { should have_many(:articles) }
    end
  end
end
