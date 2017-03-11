class CompaniesController < ApplicationController

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
	@gigs = Gig.where(company_id: @company.id)

end



private 


def company_params
		params.require(:company).permit(:cname, :industry, :email, :website, :location, :description)
	end


end