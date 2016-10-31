require "rails_helper"

RSpec.feature "user can create a link submission" do
  context "authenticated user" do
    scenario "using link form" do
      user = User.create(email: "kristaps", password: "porzingis")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      url   = "knicks.com"
      title = "Knicks site"

      visit links_path

      expect(page).to have_content("Submit a New Link")
      fill_in "link[title]", with: title
      fill_in "link[url]", with: url
      click_button "Submit Link"

      link = Link.last
      expect(link.url).to eq(url)
      expect(link.title).to eq(title)
      expect(link.status).to eq("false")
      expect(link.user).to eq(user)

      expect(current_path).to eq links_path

      expect(page).to have_content link.url
      expect(page).to have_content link.title
      expect(page).to have_content link.status

    end
  end
end
