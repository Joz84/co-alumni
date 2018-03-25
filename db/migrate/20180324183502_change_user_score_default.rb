class ChangeUserScoreDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :score, from: nil, to: 0 
  end
end
