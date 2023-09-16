# This is a recipe model.

class Recipe < ApplicationRecord
  # The title of the recipe is required
  validates :title, presence: true

  # Considered to be anonymous if not present
  belongs_to :author, class_name: "User"

  # Only published recipes are shown to the public
  scope :published, -> { where(published: true) }

  # The image of the recipe
  has_one_attached :image

  # The ingredients and directions are stored as rich text
  has_rich_text :directions

  # A way to remove the image is to set remove_image to 1
  attribute :remove_image, :string
  after_update do
    image.purge if remove_image == "1"
  end

  # Full text search
  include PgSearch::Model
  pg_search_scope :search,
        against: %i[title description],
        using: { tsearch: { dictionary: 'english' } }
end
