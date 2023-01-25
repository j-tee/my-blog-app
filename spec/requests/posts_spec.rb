require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { FactoryBot.create(:user) } # create a user instance
  let(:post) { FactoryBot.create(:post, user:) } # create a post instance
  describe 'GET posts#index' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'has expected string in response' do
      get "/users/#{user.id}/posts"
      expect(response.body).to include('A user with a list of posts')
    end
  end

  describe 'GET post#show' do
    it 'returns http success' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(:success)
    end
    it 'renders the correct template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'has expected string in response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('A post details with a list of comments')
    end
  end
end
