class RemoveFieldsFromFundraisings < ActiveRecord::Migration[5.0]
  def change
    remove_column :fundraisings, :CampaignPicture
    remove_column :fundraisings, :campaign_image
  end
end
