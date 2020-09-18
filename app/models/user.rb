class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  # include Devise::JWT::RevocationStrategies::JTIMatcher

  # devise :database_authenticatable,
  #        :jwt_authenticatable, jwt_revocation_strategy: self
  
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :user_workouts, dependent: :destroy
  has_many :workouts, through: :user_workouts
end
