class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      json_response(UserSerializer.new(@user), :created)
    else
      render json: @user.errors, status: :unprocessable_entity
    end 
  end


end
