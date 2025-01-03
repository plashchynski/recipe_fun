# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { should have_many(:recipes).dependent(:destroy).with_foreign_key(:author_id) }
  end

  describe 'attachments' do
    it { should have_one_attached(:avatar) }
  end
end
