class Experiment < ApplicationRecord
	belongs_to :user

  #scope :searched_experiments -> where("title LIKE ?", "%#{params[:title]}%")

end
#scope :my_scope, ->(query) { includes(:table2).where(["table2.property LIKE (?)", "#{query}%"]) }
#{}"name LIKE ? OR postal_code LIKE ?", "%#{search}%", "%#{search}%"