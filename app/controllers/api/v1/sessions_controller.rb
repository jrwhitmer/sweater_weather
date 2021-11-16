class Api::V1::SessionsController < ApplicationController

  def new
    @matching_user = User.find_by_email(params[:user][:email])

    if !@matching_user.nil?
      if @matching_user.password == params[:user][:password]
        json_response(UserSerializer.new(@matching_user))
      else
        render_invalid_params("invalid user data")
      end
    else
      render_invalid_params("invalid user data")
    end
  end

end
