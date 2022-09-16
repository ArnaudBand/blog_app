require 'spec_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  subject(:post) { Post.create(author:, title: 'Hello', text: 'This is my first post') }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without an author' do
    post.author = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a text' do
    post.text = nil
    expect(post).to_not be_valid
  end
end
