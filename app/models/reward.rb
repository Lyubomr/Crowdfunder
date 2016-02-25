class Reward < ActiveRecord::Base
  # If we want to have a reward belong to a user: belongs_to :user
  belongs_to :project
end
