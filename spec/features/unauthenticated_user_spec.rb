require 'rails_helper'

RSpec.feature 'unauthenticated user visits root page' do
  scenario 'unauthenticated user is sees links to login page' do
    visit '/'

    expect(current_path).to eq(root_path)

    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
  end

  scenario 'clicking sign up sends me to a new user page' do
    visit '/'

    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)
    expect(page).to have_button("Sign Up")
  end

  scenario 'fill out user information to create a new account' do
    visit '/'

    click_on "Sign Up"

    fill_in "Email", with: 'kristaps'
    fill_in "Password", with: 'porzingis'
    fill_in "Password Confirmation", with: 'porzingis'

    click_on 'Sign Up'

    expect(current_path).to eq(links_path)
  end

  scenario 'if an email exists, user cannot be created again' do
    user = User.create(email: 'kristaps', password: 'porzingis')
    user_2 = User.create(email: 'kristaps', password: 'porzingawd')

    visit '/'

    click_on "Sign Up"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password Confirmation", with: user.password

    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)
    expect(User.count).to eq(1)

    click_on "Sign Up"

    fill_in "Email", with: user_2.email
    fill_in "Password", with: user_2.password
    fill_in "Password Confirmation", with: user_2.password

    click_on "Sign Up"

    expect(User.count).to eq(1)
    expect(page).to have_content("Incorrect email/password. Try again")

  end

  scenario "passwords must match" do
    visit '/'

    click_on "Sign Up"

    fill_in "Email", with: 'kristaps'
    fill_in "Password", with: 'porzingis'
    fill_in "Password Confirmation", with: 'melo'

    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)
    expect(User.count).to eq(0)
    expect(page).to have_content("Incorrect email/password. Try again")
  end
end
