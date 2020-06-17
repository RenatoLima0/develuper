class Developer < ApplicationRecord
  belongs_to :user
  has_one :project
  has_many :chatrooms
  has_many :portifolios
end
