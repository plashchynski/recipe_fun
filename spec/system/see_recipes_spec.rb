# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "System", type: :system do
  fixtures :users
  fixtures :recipes

  let(:user) { users(:john) }
  let(:hummus) { recipes(:hummus) }
  let(:chicken) { recipes(:chicken) }

  it "should allow a user to see recipes" do
    visit recipes_path

    expect(page).to have_content(hummus.title)
    expect(page).to have_content(chicken.title)
  end

  it "should allow a user to search for a recipe" do
    visit recipes_path

    fill_in "Search", with: "hummus"
    click_on "Search"

    expect(page).to have_content(hummus.title)
    expect(page).not_to have_content(chicken.title)
  end
end
