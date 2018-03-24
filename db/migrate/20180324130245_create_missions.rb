class CreateMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :score
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
