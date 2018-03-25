class UserMissionsController < ApplicationController
  # def create
  #   @user_mission = UserMission.new

  #   if current_user.user_missions.find_by(mission: @mission).nil?
  #     @user_mission = UserMission.new


  #   else
  #     @user_mission = current_user.user_missions.find_by(mission_id: params[:id])
  #   end
  # end


  # def create
  #   @participant = @seating_plan.participants.new(participant_params)

  #   @recent_participants = @seating_plan.participants.where(pulse: true)
  #   @recent_participants.each { |participant| participant.update(pulse: false) }
  #   @participant.pulse = true if @participant.present?

  #   @relationship = Relationship.new



  #   if @participant.save
  #     @participant.allocate_seat
  #     redirect_to seating_plan_tables_path(@seating_plan)
  #     flash[:notice] = "Successfully added your guest : #{@participant.first_name.capitalize} #{@participant.last_name.capitalize}"
  #   else
  #     render 'tables/index'
  #   end
  # end

  # private

  # def participant_params
  #   params.require(:user_mission).permit(
  #     :first_name,
  #     :last_name,
  #     :age_range,
  #     :family_type,
  #   )
  # end
end
