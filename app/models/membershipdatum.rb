require 'csv'

class Membershipdatum < ApplicationRecord
  belongs_to :organisation


  #organisation_id
  # def self.import(files,organisation_id)


  #   spreadsheet = Roo::Spreadsheet.open(files.path)


  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do
  #      row = Hash[[header,spreadsheet.row(i)].transpose]
  #      membershipdatum = Membershipdatum.new
  #      membershipdatum.attributes = row.to_hash
  #      membershipdatum.organisation_id = organisation_id
  #      membershipdatum.save!
  #     end
  # end


end

 # spreadsheet = Roo::Spreadsheet.open(file.path)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do
    #   row = Hash[[header,spreadsheet.row(i)].transpose]
    #   membershipdatum = find_by(id: row["id"]) || new
    #   membershipdatum.attributes = row.to_hash
    #   membershipdatum.save!
    #   end