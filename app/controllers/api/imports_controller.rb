class ImportsController < ApplicationController
  def create
    user = User.find_by!(token: permitted_params)

    if Rails.env.development?
      ImportJob
        .set(wait_until: Time.now + 5.seconds)
        .perform_later(user.id)
    else
      ImportJob.perform_later(user.id)
    end

    head 200
  end

  private

  def permitted_params
    params.require(:token)
  end
end
