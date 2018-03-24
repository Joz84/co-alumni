class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :resources #, inverse_of: :supervisor
  has_many :missions
  has_many :user_missions
  has_many :my_missions, through: :user_missions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
