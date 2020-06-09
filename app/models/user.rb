class User < ApplicationRecord
  has_one :project_owner
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
<<<<<<< HEAD
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :address, :phone, :presence: true, on: :update
=======
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
>>>>>>> 4304d294be4bf2ea35476b6242ee21e5a3798e1b
end
