require 'rails_helper'

RSpec.feature 'Users#index', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create(:post, user:)
    FactoryBot.create_list(:user, 3)
    visit users_path
    sleep(5)
  end

  scenario 'I can see the profile picture for each user' do
    user.photo = '<span class="photo"> <img src="https://robohash.org/voluptatibusperspiciatissuscipit.png?size=300x300&amp;set=set1" width="100" height="100" /> </span>'
    within(first('.user-list')) do
      expect(page.body).to include(user.photo)
    end
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    link = page.find_link(user.name)
    link.click
    expect(current_path).to eq(user_path(id: user.id, format: :html))
  end

  scenario 'I can see the username of all other users' do
    within(first('.user-list')) do
      user.name = 'Georgianne Boehm'
      expect(page).to have_content(user.name)
    end
  end

  scenario 'I can see the number of posts each user has written' do
    within(first('.user-list')) do
      expect(page).to have_content("number of posts: #{user.posts.count}")
    end
  end
end
RSpec.feature 'Users#show', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  before do
    FactoryBot.create(:post, user:)
    FactoryBot.create_list(:user, 3)
    visit users_path
    sleep(5)
  end

  scenario 'I can see the number of posts each user has written' do
    within(first('.user-list')) do
      expect(page).to have_content("number of posts: #{user.posts.count}")
    end
  end
  scenario 'I can see the profile picture for each user' do
    user.photo = '<span class="photo"> <img src="https://robohash.org/voluptatibusperspiciatissuscipit.png?size=300x300&amp;set=set1" width="100" height="100" /> </span>'
    within(first('.user-list')) do
      expect(page.body).to include(user.photo)
    end
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    link = page.find_link(user.name)
    link.click
    expect(current_path).to eq(user_path(id: user.id, format: :html))
  end

  scenario 'I can see the username of all other users' do
    within(first('.user-list')) do
      user.name = 'Georgianne Boehm'
      expect(page).to have_content(user.name)
    end
  end
end
