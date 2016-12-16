class BeHeroController < ApplicationController
	def new 
		@payment = Payment.new
		run_first
		@user = current_user
		@client_token = Braintree::ClientToken.generate
	end

	def create 
		@current_user = User.find_by_id(params[:currentuser])
		@reward = Reward.find_by(campaign_id: params[:campaign_id], amount: params[:reward_amount])
		run_first									#check private
		run_braintree_sale				#check private
		if @result.nil? == false	#check private
			run_payment_create
			run_updates_on_campaigns
		end
		flash[:alert] = "Your payment went through succesfully!"
		redirect_to featured_index_path
	end


private 
	def run_first 
		@campaign = Campaign.find_by(id: params[:campaign_id])
		@campaign_user = @campaign.user
	end

	def run_braintree_sale
		nonce_from_the_client = params[:payment_method_nonce]
		@result = Braintree::Transaction.sale(
		  :amount => "10.00",
		  :payment_method_nonce => nonce_from_the_client,
		  :options => {
		  :submit_for_settlement => true
		  }
		)
	end

	def run_payment_create
		@payment = Payment.new 
		@payment.user_id = @current_user.id
		@payment.campaign_id = @campaign.id 
		@payment.transaction_amount = @result.transaction.amount
		@payment.transaction_id = @result.transaction.id
		@payment.reward_id = @reward.id
		@payment.save!
	end

	def run_updates_on_campaigns
		if @campaign.total_amount_contribute.nil?
			@campaign.update(total_amount_contribute: @result.transaction_amount)
		else
			@campaign.update(total_amount_contribute: @campaign.total_amount_contribute + @result.transaction.amount)
		end

		if @campaign.total_contributors.nil?
			@campaign.update(total_contributors: 1)
		else 
			@campaign.update(total_contributors: 1 + @campaign.total_contributors)
		end
	end

end
