require 'rails_helper'

RSpec.describe 'Posts', type: :system do
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
      visit user_posts_path(User.first)
    end

    it 'shows the title' do
      expect(page).to have_content('Hello 1')
    end

    it 'shows the number of likes' do
      expect(page).to have_content('Likes: 0')
    end

    it 'shows the number of comments' do
      expect(page).to have_content('Comments: 0')
    end

    it 'shows the author' do
      expect(page).to have_content('ada')
    end

    it 'shows the profile picture of all authors' do
      image = page.all('img')
      expect(image.size).to eq(1)
    end

    it 'has the button pagination' do
      expect(page).to have_content('Pagination')
    end

    it 'redirects to the post page when clicking on the title' do
      click_link('Hello 1')
      expect(page).to have_content('Hello 1')
    end
  end

  describe 'show page:' do
    let(:author) { User.first.id }
    subject(:post) { Post.first.id }
    before(:example) do
      visit user_post_path(author, post)
    end
    it 'shows post\'s title' do
      expect(page).to have_content('Hello 1')
    end
    it 'shows post\'s author name' do
      expect(page).to have_content('ada')
    end
    it 'shows the post\'s number of comments' do
      expect(page).to have_content('Comments: 0')
    end
    it 'shows the post\'s number of likes' do
      expect(page).to have_content('Likes: 0')
    end
    it 'shows the post\'s text' do
      expect(page).to have_content('This is my first post')
    end

    it 'shows the name of commentors' do
      expect(page).to have_content('ada')
    end
  end
end