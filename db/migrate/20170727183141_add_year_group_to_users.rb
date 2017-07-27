class AddYearGroupToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :YearGroup, :string
  end
end
