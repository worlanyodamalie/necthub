class AddOrganisationToMembershipdata < ActiveRecord::Migration[5.0]
  def change
    add_column :membershipdata, :Organisation, :string
  end
end
