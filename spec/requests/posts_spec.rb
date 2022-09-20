require 'spec_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  subject(:post) { Post.create(author: user, title: 'Hello 1', text: 'This is my first post') }

  describe 'GET /posts' do
    before(:example) do
      get "#{users_path}/#{user.id}/posts"
    end

    it 'should succeed to render index' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('Here are a list of all the posts')
    end
  end

  describe 'GET /posts/:id' do
    before(:example) do
      get "#{users_path}/#{user.id}/posts/#{post.id}"
    end

    it 'should succeed to render show' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('Here is the post with id')
    end
  end
end
