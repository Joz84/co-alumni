class CreateUserMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_missions do |t|
      t.references :user, foreign_key: true
      t.references :mission, foreign_key: true
      t.integer :status
      t.datetime :date

      t.timestamps
    end
  end
end
