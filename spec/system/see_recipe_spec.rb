# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "System", type: :system do
  fixtures :users
  fixtures :recipes

  let(:user) { users(:john) }
  let(:hummus) { recipes(:hummus) }

  it "should allow a user to see a specific recipe" do
    visit recipe_path(hummus)
    expect(page).to have_content(hummus.title)
  end
end
