class User < ApplicationRecord
  has_one :project_owner
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable


validates :name, :address, :phone, presence: true, on: :update
end