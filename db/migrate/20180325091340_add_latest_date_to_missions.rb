class AddLatestDateToMissions < ActiveRecord::Migration[5.1]
  def change
    add_column :missions, :lastest_date, :datetime
  end
end
