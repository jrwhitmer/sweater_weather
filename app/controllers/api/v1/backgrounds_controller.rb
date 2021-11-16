class Api::V1::BackgroundsController < ApplicationController

  def index
    if params_exist(params[:location])
      render json:
      ReportFacade.new_background_report(params[:location])
    else
      render_invalid_params('invalid parameters provided')
    end
  end


end
