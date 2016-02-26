class Project < ActiveRecord::Base
  has_many :rewards
  has_many :tags, as: :tagable
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true # <= needed to destory specific nested forms AKA rewards.

  mount_uploader :featured_image, ImageUploader

  def update_reward
    @project.goal
  end
end
