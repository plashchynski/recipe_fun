# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "System", type: :system do
  fixtures :users
  fixtures :recipes

  let(:user) { users(:john) }
  let(:hummus) { recipes(:hummus) }

  it "should allow a user to be registered" do
    visit new_user_registration_path
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "doe@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
