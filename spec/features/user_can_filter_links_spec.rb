require 'rails_helper'

RSpec.feature 'read/unread filter functionality', js: true do
  scenario 'clicking show read function' do
    user = User.create(email: "kristaps", password: "porzingis")
    link_1 = Link.create(title: "KP", url: "http://isthebest.com", read: true, user: user)
    link_2 = Link.create(title: "Melo", url: "http://iscooltoo.com", read: true, user: user)
    link_3 = Link.create(title: "Rose", url: "http://isupanddown.com", read: false, user: user)

    visit '/login'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_2.title)
    expect(page).to have_content(link_3.title)

    find(".filter-read").click

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_2.title)
    expect(page).to have_no_content(link_3.title)
  end

  scenario 'clicking show unread function' do
    user = User.create(email: "kristaps", password: "porzingis")
    link_1 = Link.create(title: "KP", url: "http://isthebest.com", read: false, user: user)
    link_2 = Link.create(title: "Melo", url: "http://iscooltoo.com", read: false, user: user)
    link_3 = Link.create(title: "Rose", url: "http://isupanddown.com", read: true, user: user)

    visit '/login'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_2.title)
    expect(page).to have_content(link_3.title)

    find(".filter-unread").click

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_2.title)
    expect(page).to have_no_content(link_3.title)
  end

  scenario 'clicking show all shows all function' do
    user = User.create(email: "kristaps", password: "porzingis")
    link_1 = Link.create(title: "KP", url: "http://isthebest.com", read: true, user: user)
    link_2 = Link.create(title: "Melo", url: "http://iscooltoo.com", read: true, user: user)
    link_3 = Link.create(title: "Rose", url: "http://isupanddown.com", read: false, user: user)

    visit '/login'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_on "Log In"

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_2.title)
    expect(page).to have_content(link_3.title)

    find(".filter-read").click

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_2.title)
    expect(page).to have_no_content(link_3.title)

    find(".all").click

    expect(page).to have_content(link_1.title)
    expect(page).to have_content(link_2.title)
    expect(page).to have_content(link_3.title)
  end
end
