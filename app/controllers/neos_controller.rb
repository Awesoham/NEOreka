class NeosController < ApplicationController
	def index
		@neos = Neo.includes(:user).page(params[:page]).per(20)
	end

	def show
		@neo = Neo.find(params[:id])
	end

	def new
		authenticate_user!
		@neo = Neo.new
		@neo.observations.build
	end

	def create
		authenticate_user!
		@neo = current_user.neos.build(params[:neo])
		if @neo.save
			@neo.observations.each do |o|
				o.neo = @neo
				o.user = current_user
				o.save!
			end	
			redirect_to neo_url(@neo)
		else
			render 'new'
		end		
	end	

	def edit
		authenticate_user!
		@neo = Neo.find(params[:id])
		@user = @neo.user
	end

	def update
		authenticate_user!
		@neo = Neo.find(params[:id])
		if @neo.update_attributes(params[:neo])
			obs = @neo.observations.last
			obs.user = current_user
			obs.save!
			redirect_to neo_url(@neo)
		else
			flash[:warning] = "Failed!"
			render 'edit'
		end		
	end

	def destroy
		@neo = Neo.find(params[:id])
		if current_user = @neo.user
			@neo.destroy
			flash[:success] = "NEO deleted. Party hard."
			redirect_to '/neos/'
		else
			flash[:warning] = "You didn't report that NEO - you can't delete that!"	
			redirect_to neo_path(@neo)
		end
	end	
	
	def neos_of
		@user = User.find(params[:id])
		@neos = @user.neos.all
	end
	
	def vote_up
		authenticate_user!
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
		authenticate_user!
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