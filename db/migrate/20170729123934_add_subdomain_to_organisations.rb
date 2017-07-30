class AddSubdomainToOrganisations < ActiveRecord::Migration[5.0]
  def change
    add_column :organisations, :subdomain, :string
  end
end
