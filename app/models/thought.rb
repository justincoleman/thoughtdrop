class Thought < ActiveRecord::Base
    belongs_to :user

    ratyrate_rateable "quality"
end
