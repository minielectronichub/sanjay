class LabsController < ApplicationController
	def index
      
	end	

	def new 
     @lab = current_user.labs.build
     @experiment = current_user.experiments.build(experiment_params)
	 @experiment.lab_id = params[:lab_id]
	end 

	def create 
	end	
	
	private 
	def lab_params
		params.require(:experiment).permit(:title)		
	end
end
