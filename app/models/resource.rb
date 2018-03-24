class Resource < ApplicationRecord
  belongs_to :supervisor, class_name: 'User', foreign_key: 'user_id' #, inverse_of: :resources
  belongs_to :kind
  has_many :mission_resources
  mount_uploader :photo, PhotoUploader

  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :supervisor, presence: true
end
