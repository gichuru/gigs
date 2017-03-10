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
	redirect_to @profile	
end

def show

end



private 


def company_params
		params.require(:company).permit(:sname, :category, :sdate, :edate, :role, :email, :website, :address, :description)
	end


end