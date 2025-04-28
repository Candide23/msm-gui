class MoviesController < ApplicationController

  

  def create

    movie = Movie.new
    movie.title = params.fetch("the_title")
    movie.year = params.fetch("the_year")
    movie.duration = params.fetch("the_duration")
    movie.description = params.fetch("the_desciption")
    movie.image = params.fetch("the_image")
    movie.director_id = params.fetch("the_director_id")
    
    movie.save

    redirect_to("/movies")
    
  end
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def destroy

    the_id = params.fetch("an_id")
   the_movie = Movie.where({:id => the_id}).at(0)

   the_movie.destroy

   redirect_to("/movies")
    
  end
end
