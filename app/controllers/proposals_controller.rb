class ProposalsController < ApplicationController
	before_action :set_resume, only: [:show]

	def create
		@gig = Gig.find(params[:gig_id])
		@proposal = @gig.proposals.build(proposal_params)
		@proposal.user_id = current_user.id
		@proposal.save!
		redirect_to @proposal.gig		
	end

private

	def proposal_params
		params.require(:proposals).permit(:gig, :resume, :description)	
	end
end