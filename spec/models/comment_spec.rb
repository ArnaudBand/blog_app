require 'spec_helper'

RSpec.describe Comment, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  comment = Comment.create(author: first_user, post: first_post, text: 'This is my first comment')

  it 'is valid with valid attributes' do
    expect(comment).to be_valid
  end

  it 'is not valid without an author' do
    comment.author = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a post' do
    comment.post = nil
    expect(comment).to_not be_valid
  end

  it 'is not valid without a text' do
    comment.text = nil
    expect(comment).to_not be_valid
  end
end
