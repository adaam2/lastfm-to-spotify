class ImportsController < ApplicationController
  def create
    user = User.first

    if Rails.env.development?
      ImportJob.perform_now(user.id)
    else
      ImportJob.perform_later(user.id)
    end

    head 200
  end
end
