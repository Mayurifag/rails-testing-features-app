require 'kinopoisk_parser'

namespace :kinopoisk do
  desc "Parse MoriCinemaToday database and export needed info to Movies"
  task :parse_mori => :environment do
    titles = MoriCinemaToday.pluck(:title)
    titles.each{|p|
      movie = Kinopoisk::Movie.new "#{p}"
      Movie.create!({
        title: "#{movie.title}",
        slogan: "#{movie.slogan}",
        imdb_rating: "#{movie.imdb_rating}",
        rating: "#{movie.rating}",
        countries: "#{movie.countries}",
        budget: "#{movie.budget}",
        box_office_ru: "#{movie.box_office_ru}",
        premiere_world: "#{movie.premiere_world}",
        premiere_ru: "#{movie.premiere_ru}",
        duration: "#{movie.duration}",
        description: "#{movie.description}",
        directors: "#{movie.directors.join(", ").to_s}",
        producers: "#{movie.producers.join(", ").to_s}",
        composers: "#{movie.composers.join(", ").to_s}",
        genres: "#{movie.genres.join(", ").to_s}",
        poster_image_url: "#{movie.poster}"
        })
        random = rand(3.0..11.0)
        puts "Фильм #{movie.title} добавлен. Для обхода антипарсера \
             кинопоиска будет добавлена случайная задержка, равная #{random}."
        sleep random
    }
  end
end
