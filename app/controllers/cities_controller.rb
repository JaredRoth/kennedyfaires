class CitiesController < ApplicationController
  def show
    @city = City.where("name ILIKE ?", params[:name]).first
  end
end
