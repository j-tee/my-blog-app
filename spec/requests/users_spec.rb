require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) } # create a user instance
  let(:post) { FactoryBot.create(:post, user:) } # create a post instance
  describe 'GET users#index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      get '/'
      expect(response).to render_template(:index)
    end
    it 'has expected string in response' do
      get '/'
      expect(response.body).to include('List of users')
    end
  end

  describe 'GET users#show' do
    it 'returns http success' do
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
    it 'has expected string in response' do
      get "/users/#{user.id}"
      expect(response.body).to include("A user's details with a list of posts")
    end
  end
end
