class Group < ApplicationRecord
   #has_many :users
   #has_many :organisations, through: :users
  belongs_to :organisation
  belongs_to :user
end
