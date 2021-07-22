class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({:template => "actor_templates/index.html.erb"})
  end

  def actor_details
    the_id = params.fetch("an_id")
    @the_actor = Actor.where({:id=>the_id}).at(0)
    @the_character = Character.where({:actor_id => @the_actor.id})
    #@the_movie = Movie.where({:movie_id => @the_character.movie_id})
    render({:template => "actor_templates/show.html.erb"})
  end

end
