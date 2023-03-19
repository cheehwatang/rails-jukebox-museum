class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jukeboxes, dependent: :destroy

  validates :email, :password, :username, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false }
end
