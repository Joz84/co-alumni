class MissionResource < ApplicationRecord
  belongs_to :mission, inverse_of: :mission_resources
  belongs_to :resource
end
