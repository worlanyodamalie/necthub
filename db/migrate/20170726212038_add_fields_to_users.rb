class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :profession, :string
    add_column :users, :education, :string
    add_column :users, :skills, :string
  end
end
