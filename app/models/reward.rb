class Reward < ActiveRecord::Base
  # If we want to have a reward belong to a user: belongs_to :user
  belongs_to :project
  has_many :users, through: :rewards
  validates_numericality_of :amount, :greater_than => 0, :only_integer => true
  validates_presence_of :user_id, :project_id, :amount, :on => :create

  def formatted_reward
     formatted_n = "$" + amount.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
  end
end
  # total_rewards = 0
  #   if @project.rewards.lenght > 0
  #     @project.rewards.each do |reward|
  #       if reward !=0
  #         total_reward = total_reward.to_i + reward.amount.to_i
  #       end
  #     end
  #   end
  # end
