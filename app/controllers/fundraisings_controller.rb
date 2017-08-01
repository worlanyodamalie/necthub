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
         #flash[:notice] = "Fundraising campaign created successfully"

        redirect_to fundraisings_path
        else
          # flash[:alert] = "Something went wrong"

           redirect_to new_fundraising_path
        end

  end

  def show
    @fundraising = Fundraising.find(params[:id])
  end

  private
  def fundraising_params
    params.require(:fundraising).permit(:title,:description,:city,:country,:campaign_pic)
  end

end
