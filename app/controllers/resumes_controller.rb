class ResumesController < ApplicationController

	#before_action :set_resume, only: [:index, :show, :edit, :update, :destroy]

	def index
		@resume = Resume.all
	end

	def new
		@resume = Resume.new	
	end

	def create
		@resume = Resume.new (resume_params)
		@resume.save!
		redirect_to @resume
	end

	def show
		@resume = Resume.find(params[:id])
		@jobs = Job.where(resume_id: @resume.id)
		@edus = Edu.where(resume_id: @resume.id)

	end

	def destroy
		@resume.destroy
		redirect_to @resume	
	end

private

	def resume_params
		params.require(:resume).permit(:fname, :lname, :age, :bio, :phone)
	end

end