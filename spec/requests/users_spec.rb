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
end
