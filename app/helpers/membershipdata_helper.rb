require 'roo'
require 'csv'

module MembershipdataHelper


  def upload(files,organisation_id)

    spreadsheet = Roo::Spreadsheet.open(files.path)
    spreadsheet.parse(clean: true)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
       row = Hash[[header,spreadsheet.row(i)].transpose]

       membership = Membershipdatum.new(row.to_hash)

       membership.update(organisation_id: organisation_id)

       membership.save!

    end

  end

end

