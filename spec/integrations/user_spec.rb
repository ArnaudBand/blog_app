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
      expect(page).to have_content('Number of posts: 1')
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
    subject(:author) { User.first.id }
    before(:example) do
      visit user_path(author)
    end

    it 'should show profle picture' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it 'should show the username' do
      expect(page).to have_content('ada')
    end

    it 'should show the number of posts' do
      expect(page).to have_content('Number of posts: 1')
    end

    it 'should show the number of comments' do
      expect(page).to have_content('Comments: 0')
    end

    it 'should show the number of likes' do
      expect(page).to have_content('Likes: 0')
    end

    it 'shold show the button to create a new post' do
      expect(page).to have_content('Make new post')
    end

    it 'redicts when clicking on the user\'s post' do
      click_link('Hello 1')
      expect(page).to have_content('Hello 1')
    end

    it 'redicts when clicking on see all posts' do
      click_link('See all posts')
      expect(page).to have_content('Hello 1')
    end
  end
end
