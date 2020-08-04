require 'rails_helper'

RSpec.describe 'Post, Comment and Like management', type: :feature do
  let(:user) { User.create!(name: 'Mohammad', email: 'jay@gmail.com', password: 'abc123456789') }
  let(:friend) { User.create!(name: 'James', email: 'fahad@gmail.com', password: 'abc123456789') }

  scenario 'create posts' do
    visit root_path
    click_link 'Sign up'

    # Fill the fields
    fill_in('user[name]', with: 'Mohammad')
    fill_in('user[email]', with: 'jay@gmail.com')
    fill_in('user[password]', with: 'abc123456789')
    fill_in('user[password_confirmation]', with: 'abc123456789')
    click_button 'Sign up'
    click_on 'Timeline'

    # Fill the fields to create a post
    fill_in('post[content]', with: 'This is a new post!')
    click_button 'Save'
    expect(page).to have_content('Post was successfully created.')
    expect(page).to have_content('Recent posts')

    click_link 'Like!'
    expect(page).to have_content('You liked a post.')
    expect(page).to have_link('Dislike!')

    # Fill the fields to create a comment
    fill_in('comment[content]', with: 'I am just commenting!')
    click_button 'Comment'
    expect(page).to have_content('Comment was successfully created.')
    click_link 'Sign out'
  end
end
