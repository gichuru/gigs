class GigsController < ApplicationController
	 before_action :set_company, except: [:index, :show, :update]
	 before_action :set_gig, only: [:show, :edit, :update, :destroy]
	 # before_action :authenticate_user!, except: [:index]

	def index
		@gig = Gig.all
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
		@company = Company.where(gig_id: @gig.id)
		@proposal = @gig.proposals.order("created_at DESC")
		# @resume = @user.resumes.order("created_at DESC")
		@resume = Resume.all
		#@resumes = Resume.where(user_id: @user.id).order("created_at DESC")
		@awarded_internship = Proposal.where(id: @gig.awarded_internship).first
	end


	def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'gig was successfully updated.' }
        format.json { render :show, status: :ok, location: @gig }
      else
        format.html { render :edit }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@gig.destroy
		redirect_to company_path(@company)
	end


	
#private stuff
	private

	def set_company
		@company = Company.find(params[:company_id])	
	end

	def set_gig
		@gig = Gig.find_by(:id => params[:id])
	end

	def gig_params
		params.require(:gig).permit(:name, :description, :budget, :startdate, :duration, :location, :category_id, :skill_list, :awarded_internship)
	end




end