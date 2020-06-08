Rails.application.config.active_record.belongs_to_required_by_default = false

class Project < ApplicationRecord
  belongs_to :project_owner
  
  validates :title, presence: true
  validates :description, presence: true

end
