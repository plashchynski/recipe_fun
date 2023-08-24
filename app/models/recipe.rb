class Recipe < ApplicationRecord
  validates :title, presence: true

  # Considered to be anonymous if not present
  belongs_to :user, optional: true

  has_one_attached :image
end
