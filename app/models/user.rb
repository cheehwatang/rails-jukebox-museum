class User < ApplicationRecord
  enum role: %i[user curator admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of %i[username role email]
  validates :email, uniqueness: true
end
