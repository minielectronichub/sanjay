class WelcomeController < ApplicationController

  def index
      @experiments = Experiment.all   
       @experiments = Experiment.where("title LIKE ?", "%#{params[:title]}%")
     render "index"
   
 end

end
