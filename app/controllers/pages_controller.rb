class PagesController < ApplicationController
  # before_action :authenticate_user!

  def home
    return unless current_user.present?

    @categories = Category.where(user_id: current_user.id).order(created_at: :desc) || []
  end
end
