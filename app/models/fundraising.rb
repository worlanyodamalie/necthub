class Fundraising < ApplicationRecord
  mount_uploader :campaign_pic, CampaignPicUploader

  belongs_to :organisation


end
