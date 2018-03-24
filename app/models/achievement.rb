class Achievement < ApplicationRecord
  has_many :user_achievements, dependent: :destroy

  belongs_to :user

  validates :name, :description, :required, presence: true
  validates :required, numericality: { only_integer: true }
end
