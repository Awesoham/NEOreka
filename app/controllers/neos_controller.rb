class NeosController < ApplicationController
	def index
		@neos = Neo.includes(:user).page(params[:page])
	end

	def show
		@neo = Neo.find(params[:id])
	end

	def new
		@neo = Neo.new
		@neo.observations.build
	end

	def create
		@neo = current_user.neos.build(params[:neo])
		if @neo.save
			redirect_to neo_url(@neo)
		else
			render 'new'
		end		
	end	

	def edit
		
	end

	def destroy
		
	end
	
	def neos_of
		@user = User.find(params[:id])
		@neos = @user.neos.all
	end

	def vote_up
		@neo = Neo.find(params[:id])
		unless current_user.voted_for?(@neo) then
		    current_user.vote_exclusively_for(@neo)
			redirect_to neo_path(@neo)
		else 
			flash[:warning] = "You've already voted for that!"
			redirect_to neo_path(@neo)
		end
	end

	def vote_down
		@neo = Neo.find(params[:id])
		unless current_user.voted_against?(@neo) then
			current_user.vote_exclusively_against(@neo)
			redirect_to neo_path(@neo)
		else 
			flash[:warning] = "You've already voted against this NEO. Why the hate?"
			redirect_to neo_path(@neo)
		end
	end

	def random
		redirect_to neo_path(Neo.find(rand(1..Neo.all.count)))
	end	
end