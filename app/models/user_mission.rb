class UserMission < ApplicationRecord
  belongs_to :user
  belongs_to :mission

  enum status: { booked: 0, done: 1, canceled: 2 }

  after_update :handle_points, if: ->(u) { u.changed? && u.done? }

  private

  def handle_points

  end
end
