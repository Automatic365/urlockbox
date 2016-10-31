require 'rails_helper'

RSpec.feature "visitor can create an account" do
  context "create account" do
    scenario "as a new unauthenticated user" do
      email = 'kristaps@knicks.com'
      password = 'porzingis'
      password_confirmation = 'porzingis'

      visit '/'
      click_link 'Sign Up'
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password_confirmation
      click_on 'Sign Up'
      
    end
  end
end
