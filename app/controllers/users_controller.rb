class UsersController < ApplicationController
  skip_before_action :authenticate_member!, only: [:index]

  def index
    if member_signed_in?
      id = current_member.id
      user = User.get_user(id)
      if user.persisted?
        render json: { success: true, user: user }, status: :ok
      else
        render json: { success: false, error: "User not found" }, status: :not_found
      end
    else
      @users = User.all
      render json: { success: true, users: @users }, status: :ok
    end
  end

  def show
    @user = User.find(params[:id])
    render json: { success: true, user: @user }, status: :ok
  end
end
