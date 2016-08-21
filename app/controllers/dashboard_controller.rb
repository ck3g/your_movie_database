class DashboardController < ApplicationController
  before_action :authenticate_user!

  RECENT_MOVIES_COUNT = 8

  def index
    @movies = current_user.movies.last(RECENT_MOVIES_COUNT)
  end
end
