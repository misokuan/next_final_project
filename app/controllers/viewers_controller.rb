class ViewersController < ApplicationController
	before_action :require_login

	def index
		@stream = User.find(params[:user_id]).stream
    	gon.opentok = opentok_data(@stream)
	end

  private

  def opentok_data(stream)
    token = OpenTokClient.generate_token(stream.opentok_session_id)
    { sessionId: stream.opentok_session_id, apiKey: Figaro.env.opentok_api_key, token: token }
  end


end
