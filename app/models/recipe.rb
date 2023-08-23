class Recipe < ApplicationRecord
  validates :name, presence: true

  # Considered to be anonymous if not present
  belongs_to :user, optional: true
end
