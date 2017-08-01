class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
include PgSearch

devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :groups
 has_many :organisations, through: :groups

 #has_many :memberships
 #has_many :organisations, through: :memberships

 mount_uploader :user_pic,  UserPicUploader


  scope :sorted, ->{ order(skills: :asc) }

  pg_search_scope :search,
                  against: [
                    :education,
                    :skills,
                    :first_name,
                    :Last_name,
                    :phone_number,
                    :profession

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


end
