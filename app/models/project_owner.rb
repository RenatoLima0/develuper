class ProjectOwner < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :chatrooms, through: :projects
end
