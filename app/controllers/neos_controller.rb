class NeosController < ApplicationController
	def index
		@neos = Neo.includes(:user).page(params[:page])
	end
	def show
		@neo = Neo.find(params[:id])
	end
	def new
		@neo = Neo.new
		@observations = [Observation.new]*2
	end
	def edit
		
	end
	def destroy
		
	end
	def neos_of
		@user = User.find(params[:id])
		@neos = @user.neos.all
	end
end