class WelcomeController < ApplicationController

  def index
      @experiments = Experiment.all   

   
 end

end
