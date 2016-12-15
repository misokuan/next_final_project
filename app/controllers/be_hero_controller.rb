class BeHeroController < ApplicationController
	def new 
		@user = current_user
		@campaign = Campaign.find_by(id: params[:campaign_id])
		@client_token = Braintree::ClientToken.generate
	end

	def create 
		nonce_from_the_client = params[:payment_method_nonce]
		result = Braintree::Transaction.sale(
		  :amount => "10.00",
		  :payment_method_nonce => nonce_from_the_client,
		  :options => {
		  :submit_for_settlement => true
		  }
		)
		flash[:alert] = "Your payment went through succesfully!"
		redirect_to home_path
	end
end
