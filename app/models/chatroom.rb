class Chatroom < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :developer
    belongs_to :project
    has_one :project_owner, through: :project
    validates :project, uniqueness: {scope: :developer} 
end
