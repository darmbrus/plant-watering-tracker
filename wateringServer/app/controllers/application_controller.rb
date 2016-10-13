class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :require_login

  private

  def require_login
    unless helpers.current_user
      flash[:error] = "You must be logged in for this action"
      redirect_to '/login'
    end
  end
end
