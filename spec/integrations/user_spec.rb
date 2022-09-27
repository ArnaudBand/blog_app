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

    it 'shows the number of posts' do
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('Number of posts: 0')
    end

    it 'shows the profile picture of all authors' do
      image = page.all('img')
      expect(image.size).to eq(3)
    end

    it 'redirects to the user page when clicking on the username' do
      click_link('ada')
      expect(page).to have_content('ada')
    end
  end

  describe 'show page:' do
    before(:example) { visit user_path(2) }

    it 'should show profle picture' do
      image = page.all('img')
      expect(image.size).to eq(3)
    end

    it 'should show users name' do
      expect(page).to have_content('Tom')
    end

    it 'should show the numbre of posts' do
      expect(page).to have_content('Number of posts: 4')
    end

    # it 'sholud show the Bio' do
    #   expect(page).to have_content('Bio')
    # end

    it 'should show first 3 posts' do
      expect(page).to have_content('Hello 4')
      expect(page).to have_content('Hello 3')
      expect(page).to have_content('Hello 2')
    end
  end
end
