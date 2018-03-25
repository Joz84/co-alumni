class AddFieldsToAchievements < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :name, :string
    add_column :achievements, :description, :string
  end
end
