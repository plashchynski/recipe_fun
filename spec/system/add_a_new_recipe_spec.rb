# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "System", type: :system do
  def login_as(user)
    user.password = "password123"
    user.save!
    
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password123"
    click_button "Log in"
  end

  fixtures :users

  let(:user) { users(:john) }

  it "should allow a user to create a new recipe" do
    login_as(user)
    expect(page).to have_content("Signed in successfully.")
    visit new_recipe_path
    fill_in "Title", with: "My new recipe"
    fill_in "Description", with: "My new recipe description"
    click_button "Create Recipe"
    expect(page).to have_content("Recipe was successfully created.")
  end
end
