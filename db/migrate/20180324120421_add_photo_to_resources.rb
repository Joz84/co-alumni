class AddPhotoToResources < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :photo, :string
  end
end
