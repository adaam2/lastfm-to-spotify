class AuthController < ApplicationController
  include Registry::AutoInject[
    "connect.lastfm",
    "connect.spotify",
    "connect.guest_user"
  ]

  def create
    @user = current_user
  end

  def callback
    Rails.logger.info auth_object
    @auth_object = auth_object.to_json.html_safe
    @provider = provider
  end

  def connect_to_guest_user
    params.permit!
    current_user = guest_user.call(token: token)

    case provider
    when :spotify
      spotify.call(current_user, auth_object)
    when :lastfm
      lastfm.call(current_user, auth_object)
    end

    redirect_to :root
  end

  private

  def token
    params.require("authToken")
  end

  def auth_object
    request.env["omniauth.auth"] || params.require(:authObject)
  end

  def provider
    params.require(:provider).to_sym
  end
end
