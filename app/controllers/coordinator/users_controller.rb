module Coordinator
  class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
      @ambassadors = User.where(coordinator: @user).first(5)
      @ambassador_missions = @ambassadors.map{ |ambassador| ambassador.user_missions.booked }.flatten.first(5)
      @missions_todo = @user.missions.first(4)
    end
  end
end
