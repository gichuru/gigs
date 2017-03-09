class ProfilesController < ApplicationController

def index
	@profile = Profile.all
end

def new
	@profile = Profile.new	
end

def create
	@profile = Profile.new (profile_params)
	@profile.save!
	redirect_to @profile	
end

def show
	@profile = Profile.find(params[:id])
	
end



private


def profile_params
		params.require(:profile).permit(:age, :bio, :phone)
	end


end