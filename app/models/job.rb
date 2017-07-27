class Job < ApplicationRecord
  belongs_to :organisation
  
  include PgSearch

  scope :sorted, ->{ order(company_name: :asc) }

  pg_search_scope :search,
                  against: [
                    :company_name,
                    :position
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

   def self.perform_search(keyword)
    if keyword.present?
    then Job.search(keyword)
    else Job.all
    end.sorted

end


end
