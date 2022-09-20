require 'spec_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET user#index' do
    before(:example) { get users_path }

    it 'should succeed to render index' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('Here are a list of all the users')
    end
  end

  describe 'GET user#show' do
    subject(:user) {User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')}

    before(:example) do
      get "#{users_path}/#{user.id}"
    end

    it 'should succeed to render show' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('Here is the user with id')
    end
  end
end
