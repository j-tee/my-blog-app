class UsersController < ApplicationController
  def index
    if member_signed_in?
      id = current_member.id
      p '===============member id================='
      p id
      p '===============member id================='
      user = User.get_user(id)
      p 'before redirecting==================================='
      if user.persisted?
        p 'redirecting==================================='
        redirect_to user_posts_path(user_id: user.id) 
      end
    end
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
