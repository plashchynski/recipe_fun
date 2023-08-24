# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  fixtures :recipes, :users

  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name("User") }
  end

  describe 'attachments' do
    it { should have_one_attached(:image) }
  end

  describe 'scopes' do
    describe '.published' do
      it 'returns only published recipes' do
        salad = recipes(:salad)
        secret_salad = recipes(:secret_salad)

        expect(Recipe.published).to include(salad)
        expect(Recipe.published).not_to include(secret_salad)
      end
    end
  end
end
