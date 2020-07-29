require 'rails_helper'

RSpec.describe 'Friendship management', type: :feature do
  let(:user) { User.create!(name: 'Mohammad', email: 'jay@gmail.com', password: 'abc123456789') }
  let(:friend) { User.create!(name: 'James', email: 'fahad@gmail.com', password: 'abc123456789') }

  scenario 'create account, login and create a post' do
    visit root_path
    click_link 'Sign up'

    # Fill the fields
    fill_in('user[name]', with: 'Mohammad')
    fill_in('user[email]', with: 'jay@gmail.com')
    fill_in('user[password]', with: 'abc123456789')
    fill_in('user[password_confirmation]', with: 'abc123456789')
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')

    click_on 'Timeline'
    
    fill_in('post[content]', with: 'This test worked')
    click_button 'Save'
    expect(page).to have_content('Post was successfully created.')
    expect(page).to have_content('Recent posts')
    click_link 'Sign out'
  end

  scenario 'sign in' do
    visit root_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Mohammad')

    click_on 'All users'
    expect(page).to have_content(user.name)
    expect(page).to have_link('See Profile')
  end
end
