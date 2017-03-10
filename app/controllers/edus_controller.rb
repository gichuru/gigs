class EdusController < ApplicationController

def index
	@edu = Edu.all
end

def new
	@edu = Edu.new
end

def create
	@edu = Edu.new (edu_params)
	@edu.save!
	redirect_to new_edu_path	
end

def show

end



private 


def edu_params
		params.require(:edu).permit(:sname, :sdate, :edate, :course, :description)
	end


end


