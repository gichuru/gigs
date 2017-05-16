class CompaniesController < ApplicationController
before_action :set_company, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index]

def listing
	@company = Company.where(user_id: current_user.id)
end

def index
	@company = Company.all
	@gig = Gig.all.order("created_at DESC")
end

def new
	@company = Company.new
end

def create
	@company = Company.new (company_params)
	@company.user_id = current_user.id
	@company.save!
	redirect_to @company	
end

def show
	@company = Company.find(params[:id])
	@gig = Gig.all.order("created_at DESC")
end

def destroy
	@company.destroy
	redirect_to @company
end


private 


	def company_params
		params.require(:company).permit(:cname, :industry, :email, :website, :location, :description)
	end

	def check_user
      unless (@company.user == current_user) || (current_user.admin?)
        redirect_to root_url, alert: "Sorry, this company belongs to someone else, you can only edit companies you have posted."
      end
    end

	def set_company
		@company = Company.find_by(:id => params[:id])	
	end


end