class AddOrganisationIdToMembershipdata < ActiveRecord::Migration[5.0]
  def change
    add_reference :membershipdata, :organisation, foreign_key: true
  end
end
