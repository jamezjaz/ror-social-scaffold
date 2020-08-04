require 'rails_helper'

RSpec.describe 'Log in', type: :feature do
  let(:user) { User.create!(name: 'Mohammad', email: 'jay@gmail.com', password: 'abc123456789') }
  let(:friend) { User.create!(name: 'James', email: 'fahad@gmail.com', password: 'abc123456789') }

  scenario 'sign in' do
    visit root_path
    # Fil the fields
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
    expect(page).to have_content('Mohammad')
  end

  scenario 'Send friend request' do
    visit root_path

    # Fil the fields
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')

    click_on 'All users'
    expect(page).to have_content(user.name)
    expect(page).to have_link('See Profile')
  end
end
