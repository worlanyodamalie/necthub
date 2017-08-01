class AddNetworkIdToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_reference :memberships, :network, foreign_key: true
  end
end
