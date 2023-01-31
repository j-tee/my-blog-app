require 'rails_helper'

RSpec.feature 'Users view', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create_list(:user, 3)
    visit users_path
  end

  scenario 'display all users' do
    expect(page).to have_css('.user-wrapper .user-container .user-list', count: 4)
  end

  scenario 'I can see the profile picture for each user' do
    within(first('.user-list')) do
      expect(page).to have_css(".photo img[src*='#{user.photo}']")
    end
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    within(first('.user-list')) do
      click_link(user.name)
    end
    expect(current_path).to eq(user_path(id: user.id, format: :html))
  end

  scenario 'I can see the username of all other users' do
    within(first('.user-list')) do
      expect(page).to have_link(user.name, href: user_path(id: user.id, format: :html))
    end
  end

  scenario 'I can see the number of posts each user has written' do
    within(first('.user-list')) do
      expect(page).to have_content("number of posts: #{user.posts_counter || 0}")
    end
  end
end
