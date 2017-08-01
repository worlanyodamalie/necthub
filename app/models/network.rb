class Network < ApplicationRecord
  belongs_to :organisation

  has_many  :memberships
end
