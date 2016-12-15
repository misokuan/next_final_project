class StreamsController < ApplicationController
	before_action :require_login

	def new
		@stream = Stream.new
	end

	def create
		params.permit!
		@stream = Stream.find_by(user_id: params[:user_id])
		@stream.update(params[:stream])
		redirect_to user_stream_path(current_user, @stream.id)
	end

	def show
		if current_user = User.find(params[:user_id])
	    	@stream     = current_user.stream || current_user.create_stream
	    else
	    	@stream = User.find(params[:user_id]).stream
	    end
        gon.opentok = opentok_data(@stream)
	end

  private

  def opentok_data(stream)
    token = OpenTokClient.generate_token(stream.opentok_session_id)
    { sessionId: stream.opentok_session_id, apiKey: Figaro.env.opentok_api_key, token: token }
  end


end
