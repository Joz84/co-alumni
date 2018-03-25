class Resource < ApplicationRecord
  has_many :mission_resources, dependent: :destroy
  has_many :missions, through: :mission_resources
  
  belongs_to :kind
  belongs_to :supervisor, class_name: 'User', foreign_key: 'user_id' #, inverse_of: :resources

  mount_uploader :photo, PhotoUploader

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
