class UserMission < ApplicationRecord
  belongs_to :user
  # belongs_to :mission
  belongs_to :my_mission, class_name: "Mission", foreign_key: 'mission_id'
  enum status: { to_be_done: 0, in_progress: 1, done: 2}
end
