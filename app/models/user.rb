class User < ApplicationRecord
  has_one :project_owner
  has_one :developer
  has_one_attached :photo
 
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  after_validation :geocode, if: :will_save_change_to_address?  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
    
  validates :name, :address, :phone, :role, :nickname, presence: true, on: :update
end
