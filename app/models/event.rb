class Event < ApplicationRecord
  include PgSearch

  scope :sorted, ->{ order(event_name: :asc) }

  pg_search_scope :search,
                  against: [
                    :event_name,
                    :event_date
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

  belongs_to :organisation

  mount_uploader :event_pic, EventPicUploader

  def self.perform_search(keyword)
    if keyword.present?
    then Event.search(keyword)
    else Event.all
    end.sorted

end

end
