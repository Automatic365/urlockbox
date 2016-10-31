require 'rails_helper'

RSpec.feature "visitor can create an account" do
  context "create account" do
    scenario "as a new unauthenticated user" do
      email = 'kristaps@knicks.com'
      password = 'porzingis'
      password_confirmation = 'porzingis'

      expect(User.count).to eq 0

      visit '/'
      click_link 'Sign Up'
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password_confirmation
      click_on 'Sign Up'

      expect(User.count).to eq 1
      expect(current_path).to eq links_path
      expect(page).not_to have_content "Sign In"
      expect(page).to have_content "Sign Out"
    end
  end
end
