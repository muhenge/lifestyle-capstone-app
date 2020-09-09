require 'rails_helper'
RSpec.feature 'User', type: :feature do
  scenario 'Creates a new User' do
    visit 'http://localhost:3000/users/new'

    within find('#new_user') do
      fill_in 'user[name]', with: 'RSpec'
      click_button 'commit'
    end
  rescue StandardError => e
    puts e.message.to_s
  end
end
RSpec.describe User, type: :model do
  context 'validations' do
    describe '#name' do
      let(:user) { User.create(name: 'test') }
      it 'should not be valid without a name' do
        user = User.new
        user.name = nil
        expect(user.valid?).to be false

        user.name = 'name'
        user.valid?
        expect(user.valid?).to be true
      end

      it 'Create User' do
        User.create(name: 'herve')
        user = User.all.first
        expect(user.name).to eq 'herve'
      end
    end
  end
  context 'associations' do
    describe User do
      it { should have_many(:articles) }
    end
  end
end
