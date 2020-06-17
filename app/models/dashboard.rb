Rails.application.config.active_record.belongs_to_required_by_default = false

class Dashboard < ApplicationRecord

# Search(order matters ? )
include PgSearch::Model
pg_search_scope :search_by_title_and_description,
    against: [:title, :description],
    using: {
        tsearch: {
            prefix: true
        }
    }

geocoded_by: address
after_validation: geocode,
    if :: will_save_change_to_address ?
    has_many : chatrooms

belongs_to: project_owner

validates: title, presence: true
validates: description, presence: true

def project_owner_address
project_owner.user.address
end

end