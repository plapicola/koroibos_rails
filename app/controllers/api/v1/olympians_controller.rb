class Api::V1::OlympiansController < ApplicationController
   def index
      render json: OlympianIndexSerializer.format_all(Olympian.all_with_medals)
   end
end