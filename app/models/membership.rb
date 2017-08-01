class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :organisation
  belongs_to :network
end
