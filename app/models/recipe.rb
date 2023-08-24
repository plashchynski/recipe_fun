class Recipe < ApplicationRecord
  validates :title, presence: true

  # Considered to be anonymous if not present
  belongs_to :author, class_name: "User"

  has_one_attached :image

  # A way to remove the image is to set remove_image to 1
  attribute :remove_image, :string
  after_update do
    image.purge if remove_image == "1"
  end
end
