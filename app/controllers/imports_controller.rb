class ImportsController < ApplicationController
  def create
    user = User.first
    ImportJob.perform_now(user.id)
    head 200
  end
end
