class UserMovie < ActiveRecord::Base
  belongs_to :user

  def detail
  	return Tmdb::Movie.detail(id_film)
  end

  def images
  	return Tmdb::Movie.images(id_film)
  end
end