class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:leaderboard, :svg]

  def leaderboard
    @user_missions = UserMission.limit(10)
    @best_coordinators = User.best( role: :coordinator, number: 10 )
    @best_ambassadors =  User.best( role: :ambassador,  number: 10 )

    @countries = Country.where.not(latitude: nil, longitude: nil)

    @markers = @countries.map do |country|
      {
        lat: country.latitude,
        lng: country.longitude,
        score: country.total_score,
        color: country.color
      }
    end
  end
end
