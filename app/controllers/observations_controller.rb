class ObservationsController < ApplicationController
	def index
		@observations = Observation.all
	end

	def show
		@observation = Observation.find(params[:id])
	end	

	def new
		@observation = Observation.new
	end

	def create
		@neo = current_user.neos.build(params[:neo])
		if @neo.save
			redirect_to neo_url(@neo)
		else
			render 'new'
		end	
	end
end
