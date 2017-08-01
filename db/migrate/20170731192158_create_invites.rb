class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.string :token
      t.references :organisation, foreign_key: true

      t.timestamps
    end
  end
end
