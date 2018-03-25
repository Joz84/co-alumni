class Mission < ApplicationRecord

  has_many :user_missions, dependent: :destroy
  has_many :mission_resources, dependent: :nullify, inverse_of: :mission
  has_many :resources, through: :mission_resources

  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :mission_resources,
                                reject_if: proc { |attributes| attributes[:resource_id].blank? },
                                allow_destroy: true

end
