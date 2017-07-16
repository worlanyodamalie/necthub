class RenameYearGroupToYearCompleted < ActiveRecord::Migration[5.0]
  def change
    rename_column :membershipdata, :YearGroup, :YearCompleted
  end
end
