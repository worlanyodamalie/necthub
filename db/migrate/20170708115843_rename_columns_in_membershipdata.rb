class RenameColumnsInMembershipdata < ActiveRecord::Migration[5.0]
  def change
    rename_column :membershipdata, :first_name, :FirstName
    rename_column :membershipdata, :last_name,  :LastName
    rename_column :membershipdata, :phone_number, :PhoneNumber
    rename_column :membershipdata, :year_group, :YearGroup
    rename_column :membershipdata, :email, :Email
  end
end
