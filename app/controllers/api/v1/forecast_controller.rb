class Api::V1::ForecastController < ApplicationController

def index
  if params_exist(params[:location])
    render json: ReportFacade.new_weather_report(params[:location])
  else
    render_invalid_params('invalid parameters provided')
  end
end


end
