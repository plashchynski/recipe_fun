class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  # All recipes become anonymous
  has_many :recipes, foreign_key: :author_id, dependent: :destroy

  has_one_attached :avatar

  # A way to remove the avatar is to set remove_avatar to 1
  attribute :remove_avatar, :string
  after_update do
    avatar.purge if remove_avatar == "1"
  end
end
