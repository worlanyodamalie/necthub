class JobsController < ApplicationController
  before_action :authenticate_organisation!

  layout "organisations"

  def index
    @jobs = current_organisation.jobs.all
  end


  def new
    @job = Job.new
  end

  def create

    @job = current_organisation.jobs.build(job_params)
    if @job.save
      #flash[:notice] = "Added event successfully"
      redirect_to jobs_path
    else
      #flash[:alert] = "Event not added"
      redirect_to new_job_path
      end
  end

  private

  def job_params
    params.require(:job).permit(:company_name,:position,:job_description)
  end

end
