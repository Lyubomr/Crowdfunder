class RewardsController < ApplicationController
  def create
    @project = Project.find(params[:id])
    @reward = @project.rewards.build(reward_params)
  end

  private
  def reward_params
    params.require(:reward).permit(:title, :description, :ammount)
  end
end
