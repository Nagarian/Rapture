json.array! @movies do |movie|
  user_movie = current_user.user_movies.where(movie_id: movie["id"]).first
  next if user_movie != nil && user_movie.is_seen

  json.movie movie
  
  json.user_inf do  	
	if user_movie != nil
	  json.isFav true
	else
	  json.isFav false
	end

	json.isSeen false
	
  end
end