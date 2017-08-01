class JobsController < ApplicationController
  before_action :authenticate_organisation!

  layout "organisations"

  layout "users", :only => [:jobsearch]



  def index
    @jobs = current_organisation.jobs.all
  end

   def jobsearch
    if params[:search].present?
      @jobsearchs = Job.perform_search(params[:search])
    else
      redirect_to jobsearch_jobs_path,  notice: "No Search results available at the moment"
    end
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
