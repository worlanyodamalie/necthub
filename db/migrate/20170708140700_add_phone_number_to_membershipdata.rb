class AddPhoneNumberToMembershipdata < ActiveRecord::Migration[5.0]
  def change
    add_column :membershipdata, :PhoneNumber, :string
  end
end
