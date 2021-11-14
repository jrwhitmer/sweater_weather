class ApplicationController < ActionController::API

  def params_exist(param)
    param.present?
  end

  def render_invalid_params(message)
      render json: { error: message }, status: :bad_request
  end
end
