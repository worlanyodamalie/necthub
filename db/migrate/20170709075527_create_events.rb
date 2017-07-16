class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_type
      t.datetime :event_date
      t.references :organisation, foreign_key: true

      t.timestamps
    end
  end
end
