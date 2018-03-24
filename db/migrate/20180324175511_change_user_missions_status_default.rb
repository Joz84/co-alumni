class ChangeUserMissionsStatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :user_missions, :status, from: nil, to: 0 
  end
end
