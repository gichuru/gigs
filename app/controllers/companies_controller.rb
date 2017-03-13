class CompaniesController < ApplicationController

before_action :set_company, only: [:index, :show, :edit, :update, :destroy]


def index
	@company = Company.all
end

def new
	@company = Company.new
end

def create
	@company = Company.new (company_params)
	@company.save!
	redirect_to @company	
end

def show
	@company = Company.find(params[:id])
	@gigs = Gig.where(company_id: @company.id).order("created_at DESC")
end

def destroy
	@company.destroy
	redirect_to @company
end


private 


	def company_params
		params.require(:company).permit(:cname, :industry, :email, :website, :location, :description)
	end

	def set_company
		@company = Company.find_by(:id => params[:id])	
	end


end