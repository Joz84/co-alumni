module Ambassador
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @missions_booked = @user.user_missions.includes(:mission).booked
      @missions_todo = Mission.all.first(5)
      @missions_done = @user.user_missions.includes(:mission).done
    end
  end
end
