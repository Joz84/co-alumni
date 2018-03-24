class CreateAchievements < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.integer :required
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
