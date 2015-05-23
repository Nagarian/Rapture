json.array! current_user.user_movies do |user_movie|
  json.movie user_movie.detail
  
  json.user_inf do
    json.isSeen user_movie.is_seen
    json.isFav true
  end
end