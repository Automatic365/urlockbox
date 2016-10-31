require 'rails_helper'

RSpec.feature "visitor can create an account" do
  context "as a new unauthenticated user" do
    email = 'kristaps@knicks.com'
    password = 'porzingis'
    password_confirmation = 'porzingis'

    visit '/'
    click_link 'Sign Up'
    
  end
end
