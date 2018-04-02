class Branch < ApplicationRecord
    belongs_to :collage
	has_many :labs
	has_many :experiments
end
