class LabsController < ApplicationController
	def index
      
	end	

	def new 
     @lab = current_user.labs.build
	end 

	def create 
	end	
	
	private 
	def lab_params
		params.require(:experiment).permit(:title)		
	end
end
