class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.string :video_url
      t.references :user
      t.references :kind, foreign_key: true

      t.timestamps
    end
  end
end
