class User < ActiveRecord::Base
  has_many :projects
  # The user has many rewards because of products.
  # Not to be confused with has_many :rewards which means the user created the rewards.
  has_many :rewards, through: :projects
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
end
