class AddNameToOrganisations < ActiveRecord::Migration[5.0]
  def change
    add_column :organisations, :organisation_name, :string
  end
end
