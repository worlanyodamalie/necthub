class AnnouncementsController < ApplicationController
  before_action :authenticate_organisation!

  layout "organisations"

  def index
    @announcements = current_organisation.announcements.all
  end

  def new
    @announcement = Announcement.new
  end

  def create

    @announcement = current_organisation.announcements.build(announce_params)
    if @announcement.save

       redirect_to announcements_path
    else

      redirect_to new_announcement_path
      end
  end

  private

  def announce_params
    params.require(:announcement).permit(:title,:description)
  end
end
