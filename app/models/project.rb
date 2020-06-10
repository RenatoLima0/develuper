Rails.application.config.active_record.belongs_to_required_by_default = false

class Project < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :project_owner
  
  validates :title, presence: true
  validates :description, presence: true

  def project_owner_address
    project_owner.user.address 
  end
end
