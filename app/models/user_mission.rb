class UserMission < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  delegate :creator, to: :mission

  enum status: { booked: 0, done: 1, canceled: 2 }

  after_update :handle_points, if: ->(u) { u.saved_change_to_status? && u.done? }

  private

  def handle_points
    points = mission.score
    user.update(score: user.score += points)
    return unless creator.coordinator?
    creator.update(score: creator.score += ((points * 10) / 100))
  end


  def self.same_mission_booked(mission)
    self.where(mission: mission).booked
  end
end
