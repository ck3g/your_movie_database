class PicturesController < ApplicationController
  before_action :authenticate_user!

  def destroy
    # That's how we a sure that user can remove only his own pictures
    movie = current_user.movies.find(params[:movie_id])
    movie.pictures.find(params[:id]).destroy
    redirect_back(fallback_location: dashboard_path)
  end
end
