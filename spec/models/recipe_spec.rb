# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name("User") }
  end

  describe 'attachments' do
    it { should have_one_attached(:image) }
  end
end
