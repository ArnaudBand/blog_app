require 'spec_helper'

RSpec.describe User, type: :model do
  subject(:author) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  it 'is valid with valid attributes' do
    expect(author).to be_valid
  end

  it 'is not valid without a name' do
    author.name = nil
    expect(author).to_not be_valid
  end

  it 'is not valid without a photo' do
    author.photo = nil
    expect(author).to_not be_valid
  end

  it 'is not valid without a bio' do
    author.bio = nil
    expect(author).to_not be_valid
  end

  it 'is not valid with a name longer than 30 characters' do
    author.name = 'a' * 31
    expect(author).to_not be_valid
  end

  it 'is not valid with a postCounter less than 0' do
    author.posts_counter = -1
    expect(author).to_not be_valid
  end
end
