# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "System", type: :system do
  fixtures :users
  fixtures :recipes

  let(:user) { users(:john) }
  let(:hummus) { recipes(:hummus) }

  it "should allow a user to see recipes" do
    visit recipes_path
    expect(page).to have_content(hummus.title)
  end
end
