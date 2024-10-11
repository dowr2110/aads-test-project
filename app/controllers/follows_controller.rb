class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def create
    user = User.find(params[:id])
    if current_user.follow(user)
      redirect_to follows_path, notice: "You have subscribed to #{user.email}"
    else
      redirect_to follows_path, alert: 'Something wrong'
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user.unfollow(user)
      redirect_to follows_path, notice: "You have unsubscribed to #{user.email}"
    else
      redirect_to follows_path, alert: 'Something wrong'
    end
  end
end