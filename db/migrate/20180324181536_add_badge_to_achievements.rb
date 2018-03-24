class AddBadgeToAchievements < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :badge, :string
  end
end
