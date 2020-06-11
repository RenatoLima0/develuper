class Developer < ApplicationRecord
  belongs_to :user
  has_one :project
  has_many :chatrooms
end
