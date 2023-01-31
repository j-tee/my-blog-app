RSpec.feature 'Users view', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  
  before do
    FactoryBot.create(:post, user:)
    FactoryBot.create_list(:user, 3)
    visit users_path
  end

  scenario 'display all users' do
    expect(page).to have_css('.user-wrapper .user-container .user-list', count: 4)
  end

  scenario 'I can see the profile picture for each user' do
    user = OpenStruct.new
    user.photo = 'https://robohash.org/sitpraesentiumrepellendus.png?size=300x300&set=set1'
    within(first('.user-list')) do
      expect(page).to have_xpath("//img[contains(@src,'#{user.photo}')]")
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
