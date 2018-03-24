class Mission < ApplicationRecord
  has_many :user_missions, dependent: :destroy
  has_many :mission_resources, dependent: :nullify
  has_many :resources, through: :mission_resources

  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  mount_uploader :photo, PhotoUploader
end
