class UserController < MoviesController::Base
  protect_from_forgery with: :exception


end
