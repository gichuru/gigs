class GigsController < ApplicationController

	def index
		@gig = Gig.all.order("created_at DESC").page(params[:page]).per(20)
	end

	def new
		@gig = Gig.new 
	end

	def create
		@gig = Gig.new(gig_params)
		@gig.save!
		redirect_to @gig
	end

	def show
		@gig = Gig.find(params[:id])
	end

	
#private stuff
	private

	def gig_params
		params.require(:gig).permit(:name, :description, :budget, :startdate, :duration, :location,)
	end


end