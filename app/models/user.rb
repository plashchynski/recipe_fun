class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  # All recipes become anonymous
  has_many :recipes, dependent: :nullify
end
