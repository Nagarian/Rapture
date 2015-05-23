class UserMovie < ActiveRecord::Base
  belongs_to :user

  def detail
  	return Tmdb::Movie.detail(self.movie_id)
  end

  def images
  	return Tmdb::Movie.images(self.movie_id)
  end
end