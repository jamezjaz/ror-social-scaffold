require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
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
  end
end
