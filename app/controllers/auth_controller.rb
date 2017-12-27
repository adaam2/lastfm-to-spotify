class AuthController < ApplicationController
  include Registry::AutoInject[
    "connect.lastfm",
    "connect.spotify",
    "connect.guest_user"
  ]

  def connect_to_guest_user
    render json: current_user
  end

  def callback
    service(provider).call(current_user, auth_object)
    redirect_to :root
  end

  private

  def service(provider)
    Registry::Container["connect.#{provider}"]
  end

  def auth_object
    request.env["omniauth.auth"]
  end

  def provider
    params.require(:provider)
  end
end
