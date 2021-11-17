class Api::V1::RoadTripsController < ApplicationController

  def create
      @matching_user = User.find_by_api_key(params[:road_trip][:api_key])

      if !@matching_user.nil?
        render json:
        ReportFacade.new_route_report(params[:road_trip][:origin], params[:road_trip][:destination])
      else
        render_invalid_params('unauthorized')
      end
  end

end
