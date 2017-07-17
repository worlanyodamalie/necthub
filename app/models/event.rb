class Event < ApplicationRecord
  belongs_to :organisation

  mount_uploader :event_pic, EventPicUploader
end
