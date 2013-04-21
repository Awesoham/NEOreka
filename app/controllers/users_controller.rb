class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@neos = User.find(params[:id]).neos
	end	
end