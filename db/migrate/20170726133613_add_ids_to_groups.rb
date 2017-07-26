class AddIdsToGroups < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :user, foreign_key: true
    add_reference :groups, :organisation, foreign_key: true
  end
end
