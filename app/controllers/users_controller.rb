class UsersController < ApplicationController
	def index
		@users = User.page(params[:page]).per(20)
	end

	def show
		@user = User.find(params[:id])
		@neos = User.find(params[:id]).neos
	end	
end