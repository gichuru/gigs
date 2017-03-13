class JobsController < ApplicationController
	before_action :set_resume

	def index
		@job = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		@job.resume_id = @resume.id
		@job.save!
		redirect_to @resume	
	end

	def show
		@job = Job.find(params[:id])
	end

private

	def set_resume
		@resume = Resume.find(params[:resume_id])	
	end

	def job_params
		params.require(:job).permit(:cname, :role, :sdate, :edate, :description)
	end

end
