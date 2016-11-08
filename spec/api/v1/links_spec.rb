# require 'rails_helper'
#
# RSpec.describe "update read links", type: :request do
#   it 'can update a link' do
#     user = User.create(email: "kristaps", password: 'porzingis')
#     link = Link.create(title: "Knicks", url: "http://knicks.com", user: user)
#
#
#     params = { link: { id: link.id, title: "Rule"}}
#
#     patch "/api/v1/links/#{link.id}", params
#
#     expect(response).to be_success
#
#     link.reload
#
#     expect(link.title).to eq("Rules")
#   end
# end
