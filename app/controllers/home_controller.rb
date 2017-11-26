class HomeController < ApplicationController
  def index

  end

  def setup
    @services = %w[lastfm spotify]
    @initial_state = {
      user: current_user
    }.to_json
  end
end
