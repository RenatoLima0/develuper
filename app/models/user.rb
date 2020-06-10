class User < ApplicationRecord
  has_one :project_owner
  # after_create :create_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


validates :name, :address, :phone, presence: true, on: :update

# def create_role
#     if current_user.role == Developer
#       root_path
#     else 
#       project_path
#     end
# end

end