class CitiesController < ApplicationController
    def show
        @city = City.find(params[:id])  # Trouver la ville par ID
        @gossips = Gossip.joins(:user).where(users: { city_id: @city.id }) 
        @users = @city.users
    end
end

    def index
end