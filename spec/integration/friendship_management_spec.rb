require 'rails_helper'

RSpec.describe 'Friendship management', type: :feature do
  let(:user) { User.create!(name: 'Mohammad', email: 'jay@gmail.com', password: 'abc123456789') }
  let(:friend) { User.create!(name: 'James', email: 'fahad@gmail.com', password: 'abc123456789') }

  scenario 'sign in' do
    visit root_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')

    click_on 'All users'
    expect(page).to have_content(user.name)
    expect(page).to have_link('See Profile')
  end

# scenario 'they access the home page and comment a post' do
#     visit root_path
#     fill_in 'user_email', with: 'jay@gmail.com'
#     fill_in 'user_password', with: 'abc123456789'

#     click_on 'Log in'

#     # visit posts_path
#     # fill_in 'post[content]', with: 'messages'

#     # click_button 'Save'

#     # fill_in 'comment[content]', with: 'Comment Test'

#     # click_button 'Comment'

#     expect(page).to have_content('Signed in successfully')
#   end
end