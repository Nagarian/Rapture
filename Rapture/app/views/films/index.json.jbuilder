json.array!(@films) do |film|
  json.extract! film, :id, :title, :description
  json.url film_url(film, format: :json)
end
