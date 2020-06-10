class ProjectOwner < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :chatrooms
end
