class Group < ApplicationRecord
   has_many :users
   has_many :organisations, through: :users
end
