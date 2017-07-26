class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :position
      t.string :job_description
      t.references :organisation, foreign_key: true

      t.timestamps
    end
  end
end
