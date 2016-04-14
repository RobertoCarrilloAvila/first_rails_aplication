json.array!(@urls) do |url|
  json.extract! url, :id, :long_url, :short_url, :click_count
  json.url url_url(url, format: :json)
end
