json.array!(@films) do |film|
  json.extract! film, :id, :id_film, :seen, :user_id
  json.url film_url(film, format: :json)
end
