class Invite < ApplicationRecord
  belongs_to :organisation

  before_create :generate_Invite_token

  def generate_Invite_token
    begin
      self.token = SecureRandom.urlsafe_base64(18)
    end while self.class.exists?(token: token)
  end
end
