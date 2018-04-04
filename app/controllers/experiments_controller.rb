class ExperimentsController < ApplicationController
  
  before_action :find_experiment, only: [:show, :edit, :update, :destroy]

 	def index
 	
    if params[:lab].blank?
        @experiments = Experiment.all.order("created_at DESC")
     else
	  @lab_id = Lab.find_by(title: params[:lab]).id
	  @experiments = Experiment.where(:lab_id => @lab_id).order("created_at DESC")
	 end
	end

  def search    
    # @experiments = Experiment.where(title: params[:title])
    @experiments = Experiment.where("title LIKE ?", "%#{params[:title]}%")
    render "index"
  end

  def show 
 
  end

	def new 
    @experiment = current_user.experiments.build
    @labs = Lab.all.map{ |c| [c.title, c.id] }
    @sems = Sem.all.map{ |c| [c.name, c.id] }
    @collages = Collage.all.map{ |c| [c.name, c.id] }
    @branches = Branch.all.map{ |c| [c.name, c.id] }
    
	end 

	def create 
	   @experiment = current_user.experiments.build(experiment_params)
	   @experiment.lab_id = params[:lab_id]
	   @experiment.sem_id = params[:sem_id]
	   @experiment.branch_id = params[:branch_id]
	   @experiment.collage_id = params[:collage_id]
       if @experiment.save
         redirect_to root_path
       else
       render 'new' 
      end
	end	

	def edit
	 @labs = Lab.all.map{ |c| [c.title, c.id] }
	 @branches = Branch.all.map{ |c| [c.name, c.id] }
     @sems = Sem.all.map{ |c| [c.name, c.id] }
     @collages = Collage.all.map{ |c| [c.name, c.id] }
	end

	def update
		   @experiment.sem_id = params[:sem_id]
	       @experiment.collage_id = params[:collage_id]
		   @experiment.lab_id = params[:lab_id]
		   @experiment.branch_id = params[:branch_id]
		if @experiment.update(experiment_params)
		   redirect_to experiment_path(@experiment)
		else
			render 'edit'
		end
	end

	def destroy
		@experiment.destroy
		redirect_to root_path
	end
	
	private 
	def experiment_params
		params.require(:experiment).permit(:title, :description, :components, :lab_id, :sem_id, :collage_id, :branch_id)		
	end
	def find_experiment
	 @experiment = Experiment.find(params[:id])
	end
end

