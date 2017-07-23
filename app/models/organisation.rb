class Organisation < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :membershipdata
  has_many :events
  has_many :fundraisings
  has_many :users
  has_many :groups, through: :users

end
