ActiveAdmin.register Experiment do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :title, :description, :components, :youtube_link, :lab_id, :sem_id, :collage_id, :branch_id


member_action :publish, method: :put do 
action_item :publish, only: :show do 
    link_to "Publish", publish_admin_experiment_path(experiment), method: :put if !experiment.published_at? 
end
action_item :publish, only: :show do 
    link_to "UnPublish", unpublish_admin_experiment_path(experiment), method: :put if !experiment.published_at? 
end
member_action :publish, method: :put do 
    experiment = Experiment.find(params[:id])
    experiment.update(published_at: Time.zone.now)
    redirect_to admin_experiment_path(experiment)
end 
member_action :unpublish, method: :put do 
    experiment = Experiment.find(params[:id])
    experiment.update(published_at: nil)
    redirect_to admin_experiment_path(experiment)
end 

end 













# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
