class Project < ActiveRecord::Base
  has_many :rewards

  accepts_nested_attr_for :rewards
end
