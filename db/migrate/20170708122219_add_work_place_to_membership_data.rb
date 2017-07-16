class AddWorkPlaceToMembershipData < ActiveRecord::Migration[5.0]
  def change
    add_column :membershipdata, :WorkPlace, :string
  end
end
