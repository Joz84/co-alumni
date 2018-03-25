module Ambassador
  class UsersController < ApplicationController
    def show;
      @user = User.find(params[:id])
      @missions_booked = @user.own_missions.map(&:booked)
      @missions_todo = Mission.all.first(5)
      @missions_done = @user.own_missions.map(&:done)
    end
  end
end
