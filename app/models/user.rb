class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
include PgSearch

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :groups
 has_many :organisations, through: :groups

mount_uploader :user_pic,  UserPicUploader


  scope :sorted, ->{ order(skills: :asc) }

  pg_search_scope :search,
                  against: [
                    :education,
                    :skills,

                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }

   def self.perform_search(keyword)
    if keyword.present?
    then User.search(keyword)
    else User.all
    end.sorted
  end

  #  def self.create_from_provider_data(provider_data)
  #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
  #     user.email = provider_data.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.skip_confirmation!
  #   end
  # end
end
