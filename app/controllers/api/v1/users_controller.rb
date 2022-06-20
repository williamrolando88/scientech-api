class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # PUT /users/{username}
  def update
    return if @user.update(user_params)

    render json: { errors: @user.errors.full_messages },
           status: :unprocessible_entity
  end

  # DELETE /users/{username}
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.permit(:name, :role, :email, :password, :avatar)
  end
end
