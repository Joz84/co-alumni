module Supervisor
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @coordinators = User.where(role: "coordinator").first(5)
      @supervisor_missions = @coordinators.map{ |coordinator| coordinator.user_missions.booked }.flatten.first(5)
      @missions_todo = @user.missions.first(4)
    end
  end
end
