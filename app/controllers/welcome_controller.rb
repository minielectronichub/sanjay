class WelcomeController < ApplicationController

 def index
    @experiments = Experiment.all    
    if(params[:query] && params[:query] != '')
      @search_query = params[:query]
      @experiments = Experiment.where("title LIKE ?" , "%#{@search_query.downcase}%")
      # @posts = Post.where(title: @search_query)
      respond_to do |format|
        @response = {status: "SUCCESS", experiments: @experiments}
        format.json {render json: @response}
      end
    end
 end

end
