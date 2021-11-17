class Api::V1::BackgroundsController < ApplicationController

  def index
    if params_exist(params[:location])
      @image_search = PexelFacade.image_search(params[:location])
      # render json:
      # ReportFacade.new_background_report(params[:location])
      json_response(ImageSearchSerializer.new(@image_search))
    else
      render_invalid_params('invalid parameters provided')
    end
  end


end
