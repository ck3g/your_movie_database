class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = current_user.movies.recent
  end
end
