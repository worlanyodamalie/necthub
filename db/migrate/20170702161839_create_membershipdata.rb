class CreateMembershipdata < ActiveRecord::Migration[5.0]
  def change
    create_table :membershipdata do |t|
      t.string :first_name
      t.string :last_name
      t.string :year_group
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
