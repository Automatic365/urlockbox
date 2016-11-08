require 'rails_helper'

RSpec.feature 'sort alphabetically functionality', js: true do
  scenario 'clicking sort function' do
    user = User.create(email: "kristaps", password: "porzingis")
    link_1 = Link.create(title: "KP", url: "http://isthebest.com", read: false, user: user)
    link_2 = Link.create(title: "Rose", url: "http://isupanddown.com", read: true, user: user)
    link_3 = Link.create(title: "Melo", url: "http://iscooltoo.com", read: false, user: user)

    visit '/login'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    within(".all-links:last-child") do
      expect(page).to have_content(link_3.title)
    end

    find("#sort-alphabetically").click

    within(".all-links:last-child") do
      expect(page).to have_content(link_2.title)
    end
  end
end
