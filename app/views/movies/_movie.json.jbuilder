json.extract! movie, :id, :title, :slogan, :imdb_rating, :rating, :countries, :budget, :box_office_ru, :premiere_world, :premiere_ru, :duration, :description, :directors, :producers, :composers, :genres, :created_at, :updated_at
json.url movie_url(movie, format: :json)
