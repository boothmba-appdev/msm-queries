class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render({:template => "director_templates/index.html.erb"})
  end

  def wisest
    @oldest_director = Director.where.not({:dob => nil}).order({:dob => :asc}).at(0)
    render({:template => "director_templates/eldest.html.erb"})
  end

  def youngest
    @youngest_director = Director.where.not({:dob => nil}).order({:dob => :desc}).at(0)
    render({:template => "director_templates/youngest.html.erb"})
  end

  def director_details
    require "date"
    the_id = params.fetch("an_id")
    @the_director = Director.where({:id=>the_id}).at(0)

    @create_at = Date.today - Date.parse(@the_director.created_at.strftime("%B %e, %Y"))
    @create_at = (@create_at/365).to_i
    @update_at = Date.today - Date.parse(@the_director.updated_at.strftime("%B %e, %Y"))
    @update_at = (@update_at/365).to_i

    @the_movie = Movie.where({:director_id => @the_director.id})
    render({:template => "director_templates/show.html.erb"})
  end
end
