class Resource < ApplicationRecord
  belongs_to :supervisor, class_name: 'User', foreign_key: 'user_id' #, inverse_of: :resources
  belongs_to :kind


  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :description, presence: true
  validates :supervisor, presence: true
  # validates :photo, presence: true
end
