class Country < ApplicationRecord
  has_many :users

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?

  def total_score
    users
    .map(&:score)
    .reduce(:+)
  end
end
