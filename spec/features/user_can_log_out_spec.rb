require "rails_helper"

RSpec.feature "user can log out" do
  context "log out account" do
    scenario "as a registered user" do
      user = User.create(email: "kristaps", password: "porzingis")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit links_path
      click_link "Sign Out"

      expect(current_path).to eq root_path
      expect(page).to have_content ("Log In")
      expect(page).not_to have_content("Sign Out")
    end
  end
end
