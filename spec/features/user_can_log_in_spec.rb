require 'rails_helper'

RSpec.feature 'authenticated user can log in' do
  scenario 'redirect to session login' do
    visit '/'

    click_on "Log In"

    expect(current_path).to eq(login_path)
    expect(page).to have_button("Log In")
  end

  scenario 'when login is click redirect to the links page and sign out is an option' do
    visit '/login'
    user = User.create(email: "kristaps", password: "porzingis")

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Sign Out")
  end
end
