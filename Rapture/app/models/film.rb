class Film < ActiveRecord::Base
  belongs_to :user

  def detail
  	return Tmdb::Movie.detail(self.id_film)
  end
end
