class RemoveIdsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :group_id
    remove_column :users, :organisation_id
  end
end
