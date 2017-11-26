class AuthController < ApplicationController
  include Registry::AutoInject[
    "connect.lastfm",
    "connect.spotify",
    "connect.guest_user"
  ]

  def create
    @user = guest_user.call(params)
  end

  def callback
    current_user = User.first

    Rails.logger.info auth_object

    case provider
    when :spotify
      spotify.call(current_user, auth_object)
    when :lastfm
      lastfm.call(current_user, auth_object)
    end

    redirect_to :root
  end

  private

  def auth_object
    request.env["omniauth.auth"]
  end

  def provider
    params.require(:provider).to_sym
  end
end
