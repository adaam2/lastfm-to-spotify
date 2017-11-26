class ApplicationController < ActionController::Base
  include ActionView::Layouts

  def current_user
    @current_user ||= guest_user_service.call
  end

  private

  def guest_user_service
    Registry::Container["connect.guest_user"]
  end
end
