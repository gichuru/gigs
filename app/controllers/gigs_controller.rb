class GigsController < ApplicationController
	 before_action :set_company

	def index
		@gig = Gig.all.order("created_at DESC").page(params[:page]).per(20)
	end

	def new
		@gig = Gig.new 
	end

	def create
		@gig = Gig.new(gig_params)
		@gig.company_id = @company.id
		@gig.save!
		redirect_to @company
	end

	def show
		@gig = Gig.find(params[:id])
	end

	
#private stuff
	private

	def set_company
		@company = Company.find(params[:company_id])	
	end

	def gig_params
		params.require(:gig).permit(:name, :description, :budget, :startdate, :duration, :location)
	end




end