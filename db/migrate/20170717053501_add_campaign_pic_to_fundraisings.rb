class AddCampaignPicToFundraisings < ActiveRecord::Migration[5.0]
  def change
    add_column :fundraisings, :campaign_pic, :string
  end
end
