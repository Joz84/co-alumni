class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :color
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
