class Api::V1::ActivitiesController < ApplicationController

  def index
    if params_exist(params[:destination])
      render json: ForecastActivityFacade.new_report(params[:destination])
    else
        render_invalid_params('invalid parameters provided')
    end
  end

end
