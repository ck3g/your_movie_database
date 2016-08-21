class MoviesController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie = current_user.movies.new
  end

  def create
    @movie = current_user.movies.new safe_params
    if @movie.save
      redirect_to dashboard_path, notice: I18n.t("movies.created_successfully")
    else
      render :new
    end
  end

  def show
    @movie = current_user.movies.find params[:id]
  end

  private

  def safe_params
    params.require(:movie).permit(:title, :description)
  end
end
