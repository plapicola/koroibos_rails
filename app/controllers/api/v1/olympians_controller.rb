class Api::V1::OlympiansController < ApplicationController
   def index
      render json: OlympianIndexSerializer.format_all(Olympian.send(filter(params[:age])))
   end

   private

   def filter(age)
      %w(youngest oldest).include?(age&.downcase) ? age : :all_with_medals
   end
end