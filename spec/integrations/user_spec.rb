require 'rails_helper'

RSpec.describe 'Users', type: :system do

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end

  describe 'index page:' do
    before(:example) do
      visit users_path
    end

    it 'shows the username' do
      expect(page).to have_content('Tom')
    end
  end

end