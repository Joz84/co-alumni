class CreateMissionResources < ActiveRecord::Migration[5.1]
  def change
    create_table :mission_resources do |t|
      t.references :mission, foreign_key: true
      t.references :resource, foreign_key: true

      t.timestamps
    end
  end
end
