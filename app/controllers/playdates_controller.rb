class PlaydatesController < ApplicationController
  # require 'awesome_print'
  def index
  end

  def show
    ##Get IMDB IDs
    box_office_movies = JSON.parse(HTTParty.get("https://bhtm-boxoffice.herokuapp.com"))
    @names_and_ids = {}
    box_office_movies['movies'].each_with_index do |movie, idx|
      @names_and_ids[box_office_movies['movies'][idx]['title']] = {imdb: "tt"+box_office_movies['movies'][idx]['alternate_ids']['imdb'],
        movie_poster: "http://img.omdbapi.com/?i=#{'tt'+box_office_movies['movies'][idx]['alternate_ids']['imdb']}&apikey=#{ENV['OMDB_KEY']}",
        mpaa:box_office_movies['movies'][idx]['mpaa_rating'],
        rating: box_office_movies['movies'][idx]['ratings']['critics_score'],
        synopsis:box_office_movies['movies'][idx]['synopsis'],
        release_date:box_office_movies['movies'][idx]['release_dates']['theater'],
        runtime: box_office_movies['movies'][idx]['runtime']
      }
    end

    ##Get Fandango IDs
    id_hash = {}
    nearby_theaters = Fandango.movies_near(94107)
    nearby_theaters.each do |theater|
      theater[:movies].each do |movie_title|
        if !(id_hash.has_key?(movie_title[:title]))
          id_hash["#{movie_title[:title]}"] = movie_title[:id]
        end
      end
    end
    ####
    @names_and_ids.each do |movie|
      if id_hash.has_key?(movie.first)
        movie.last[:fandango] = id_hash[movie.first]
      end
    end
  end

  def create
    new_playdate = Playdate.create(playdate_params)
    redirect_to date_path new_playdate
  end

  private

  def playdate_params
    params.require(:playdate).permit(:initiator_id,:recipient_id)
  end
end


