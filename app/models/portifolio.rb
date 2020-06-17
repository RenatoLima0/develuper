class Portifolio < ApplicationRecord
  belongs_to :developer
  has_one_attached :photo
  
  validates :link, presence: true
end
