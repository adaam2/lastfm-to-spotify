class ApplicationController < ActionController::Base
  include ActionView::Layouts

  def current_user
    @current_user ||= guest_user_service.call(token: token)
  end

  private

  def token
    params[:token]
  end

  def guest_user_service
    Registry::Container["connect.guest_user"]
  end
end
