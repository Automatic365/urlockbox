require 'rails_helper'

RSpec.feature 'user can edit urls' do
  scenario 'each link has an edit button that redirects to an edit page' do
    visit '/login'
    user = User.create(email: 'kristaps', password: 'porzingis')
    link = Link.create(title: "Knicks", url: "http://knicks.com", user: user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(page).to have_content("Knicks")
    expect(page).to have_content("http://knicks.com" )
    expect(page).to have_button("Edit Link")

    click_on "Edit Link"

    expect(current_path).to eq(edit_link_path(link))
    expect(page).to have_button("Update Link" )
  end

  scenario "user edits link" do
    visit '/login'
    user = User.create(email: 'kristaps', password: 'porzingis')
    link = Link.create(title: "Knicks", url: "http://knicks.com", user: user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    click_on "Edit Link"

    fill_in "Title", with: "Rule"
    fill_in "Url", with: "http://nba.com"

    click_on "Update Link"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Rule")
    expect(page).to have_content("http://nba.com")
  end
  scenario "user edits link with invalid url" do
    visit '/login'
    user = User.create(email: 'kristaps', password: 'porzingis')
    link = Link.create(title: "Knicks", url: "http://knicks.com", user: user)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    click_on "Edit Link"

    fill_in "Title", with: "Rule"
    fill_in "Url", with: "nada"

    click_on "Update Link"

    expect(current_path).to eq(edit_link_path(link))
    expect(page).to have_content("Your url is invalid")
  end
end
