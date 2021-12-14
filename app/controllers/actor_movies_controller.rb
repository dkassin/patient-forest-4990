class ActorMoviesController < ApplicationController
  def create
    @actor_movie = ActorMovie.create(actor_movie_params)
    redirect_to "/movies/#{@actor_movie.movie_id}"
  end

private
  def actor_movie_params
    params.permit(:movie_id, :actor_id)
  end

end
