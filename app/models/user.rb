class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy

  has_one_attached :profile_picture

  # validates :first_name, :last_name, presence: true
  # validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  # validates :profile_picture, content_type: [ "image/png", "image/jpg", "image/jpeg" ], size: { less_than: 5.megabytes }, allow_nil: true

  def display_profile_picture
    profile_picture.attached? ? profile_picture : "bluey.png"
  end
end
