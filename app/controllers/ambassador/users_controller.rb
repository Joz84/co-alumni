module Ambassador
  class UsersController < ApplicationController
    def show;
      @user = User.find(params[:id])
      @missions_live = @user.own_missions.map(&:booked)
    end
  end
end
