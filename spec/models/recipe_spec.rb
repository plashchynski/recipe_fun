# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
