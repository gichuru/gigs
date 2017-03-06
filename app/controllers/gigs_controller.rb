class GigsController < ApplicationController

	def index
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
	end

	
#private stuff
	private

	def gig_params
		params.require(:gig).permit(:name, :description, :budget, :startdate, :duration, :location,)
	end


end