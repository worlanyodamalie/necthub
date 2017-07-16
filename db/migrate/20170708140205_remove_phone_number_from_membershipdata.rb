class RemovePhoneNumberFromMembershipdata < ActiveRecord::Migration[5.0]
  def change
    remove_column :membershipdata, :PhoneNumber
  end
end
