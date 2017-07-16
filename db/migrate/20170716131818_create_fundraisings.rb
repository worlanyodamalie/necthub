class CreateFundraisings < ActiveRecord::Migration[5.0]
  def change
    create_table :fundraisings do |t|
      t.string :title
      t.string :description
      t.string :city
      t.string :country
      t.string :campaign_duration
      t.references :organisation, foreign_key: true

      t.timestamps
    end
  end
end
