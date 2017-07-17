require 'kinopoisk_parser'

namespace :kinopoisk do
  desc "Parse MoriCinemaToday database and export needed info to Movies"
  task :parse_mori => :environment do
    #Movie.destroy_all
    titles = MoriCinemaToday.pluck(:title)
    titles.each{|p|
      movie = Kinopoisk::Movie.new "#{p}"
      Movie.create!({
        title:            "#{movie.title}",
        slogan:           "#{movie.slogan}",
        imdb_rating:      "#{movie.imdb_rating}",
        rating:           "#{movie.rating}",
        countries:        "#{movie.countries.join(", ").to_s}",
        budget:           "#{movie.budget}",
        box_office_ru:    "#{movie.box_office_ru}",
        premiere_world:   "#{movie.premiere_world}",
        premiere_ru:      "#{movie.premiere_ru}",
        duration:         "#{movie.duration}",
        description:      "#{movie.description}",
        directors:        "#{movie.directors.join(", ").to_s}",
        producers:        "#{movie.producers.join(", ").to_s}",
        composers:        "#{movie.composers.join(", ").to_s}",
        genres:           "#{movie.genres.join(", ").to_s}",
        poster_image_url: "#{movie.poster}"
      })
      #random = rand(15.2..32.1) #test this_.
      puts "Фильм '#{movie.title}' добавлен."
      # sleep random
    }
  end
end
