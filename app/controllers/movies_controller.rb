class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = current_user.movies
  end

  def new
    @movie = current_user.movies.new
  end

  def create
    @movie = current_user.movies.new safe_params
    if @movie.save
      UploadPictures.upload(@movie, params[:movie_pictures])
      redirect_to dashboard_path, notice: I18n.t("movies.created_successfully")
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update_attributes safe_params
      UploadPictures.upload(@movie, params[:movie_pictures])
      redirect_to @movie, notice: t("movies.updated_successfully")
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to dashboard_path, notice: I18n.t("movies.removed_successfully")
  end

  private

  def safe_params
    params.require(:movie).permit(:title, :description)
  end

  def find_movie
    @movie = current_user.movies.find params[:id]
  end
end
