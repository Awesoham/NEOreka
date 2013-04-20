class NeosController < ApplicationController
	def index
		@neos = Neo.includes(:user).page(params[:page])
	end
	def show
		@neo = Neo.find(params[:id])
	end
	def new
		@neo = Neo.new
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