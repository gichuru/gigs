class ProposalsController < ApplicationController

	def create
		@gig = Gig.find(params[:gig_id])
		@proposal = @gig.proposals.build(proposal_params)
		@proposal.save
		redirect_to @proposal.gig		
	end

private

def set_company
		@company = Company.find(params[:company_id])	
	end

	def set_gig
		@gig = Gig.find_by(:id => params[:id])
	end

	def proposal_params
		params.require(:proposal).permit(:bid, :description)	
	end
end