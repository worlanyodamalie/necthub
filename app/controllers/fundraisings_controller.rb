class FundraisingsController < ApplicationController
  before_action :authenticate_organisation!

  layout "organisations"


  def index
    @fundraisings = current_organisation.fundraisings
  end

  def new
    @fundraising = Fundraising.new
  end

  def create
    @fundraising = current_organisation.fundraisings.build(fundraising_params)
       if @fundraising.save
         render 'index'
         else
           render 'new'
        end

  end

  def show
  end

  private
  def fundraising_params
    params.require(:fundraising).permit(:title,:description,:city,:country,:campaign_pic)
  end

end
