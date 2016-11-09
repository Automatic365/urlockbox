require "rails_helper"

RSpec.feature "links" do

  context "authenticated user" do
    scenario "using link form" do
      user = User.create(email: "kristaps", password: "porzingis")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      url   = "http://knicks.com"
      title = "Knicks site"

      visit links_path

      expect(page).to have_content("Add a New Link")
      fill_in "link[title]", with: title
      fill_in "link[url]", with: url
      click_button "Submit Link"

      link = Link.last
      expect(link.url).to eq(url)
      expect(link.title).to eq(title)
      expect(link.read).to eq(false)
      expect(link.user).to eq(user)

      expect(current_path).to eq links_path

      expect(page).to have_content link.url
      expect(page).to have_content link.title
      expect(page).to have_content link.read

    end
  end

  scenario 'submit links form can be seen' do
    visit '/login'
    user = User.create(email: 'kristaps', password: 'porzingis')

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(page).to have_content("Title")
    expect(page).to have_content("URL")
    expect(page).to have_button("Submit Link")
  end

  scenario 'an invalid url cannot be saved' do

    visit '/login'
    user = User.create(email: 'kristaps', password: 'porzingis')

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    fill_in "Title", with: "Link 1"
    fill_in "URL", with: "com"

    click_on "Submit Link"
    expect(current_path).to eq(links_path)
    expect(page).to have_no_content("Link 1")
    expect(user.links.count).to eq(0)
    expect(page).to have_content("Invalid URL")
  end
end
