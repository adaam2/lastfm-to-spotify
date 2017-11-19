class HomeController < ApplicationController
  def index
    @services = %w[lastfm spotify]
  end
end
