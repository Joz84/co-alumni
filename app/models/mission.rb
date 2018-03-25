class Mission < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :user_missions, dependent: :destroy
  has_many :mission_resources, dependent: :nullify
  has_many :resources, through: :mission_resources

  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  after_create :add_coor_points

  private

  def add_coor_points
    return unless creator.coordinator?
    creator.update(score: creator.score += 100)
  end
end
