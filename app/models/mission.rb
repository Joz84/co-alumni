class Mission < ApplicationRecord

  has_many :user_missions, dependent: :destroy
  has_many :mission_resources, dependent: :nullify
  has_many :resources, through: :mission_resources

  belongs_to :user

  mount_uploader :photo, PhotoUploader
end
