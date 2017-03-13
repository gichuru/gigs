class EdusController < ApplicationController
	before_action :set_resume

	def index
		@edu = Edu.all
	end

	def new
		@edu = Edu.new
	end

	def create
		@edu = Edu.new(edu_params)
		@edu.resume_id = @resume.id
		@edu.save!
		redirect_to @resume	
	end

	def show
		@edu = Edu.find(params[:id])
	end

private

	def set_resume
		@resume = Resume.find(params[:resume_id])	
	end

	def edu_params
		params.require(:edu).permit(:sname, :sdate, :edate, :course, :description)
	end

end


