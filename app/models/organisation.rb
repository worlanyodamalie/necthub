class Organisation < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :membershipdata

  has_many :events

  has_many :jobs

  has_many :fundraisings

  has_many :groups

  has_many :announcements

  has_many :users, through: :groups





  # def self.subdomains
  #   Organisation.pluck(:subdomain)
  # end

end
