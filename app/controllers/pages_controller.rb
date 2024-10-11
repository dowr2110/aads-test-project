class PagesController < ApplicationController
  def home
    if user_signed_in?
      @posts = current_user.subscriptions_posts.includes(:user).order(created_at: :desc)
    end
  end
end
