class MoviesController < ApplicationController

  def index
    render json: Movie.all
  end

  def create
    Movie.create params[:movie].permit(:name, :director)
    render json: Movie.all
  end

  def destroy
    Movie.destroy params[:id]
    render json: Movie.all
  end
end
