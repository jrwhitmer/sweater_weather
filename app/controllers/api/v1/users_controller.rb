require 'securerandom'

class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new({
      :email => params[:user][:email],
      :password => params[:user][:password],
      :api_key => SecureRandom.urlsafe_base64
    })

    if @user.save
      json_response(UserSerializer.new(@user), :created)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

end
