json.array!(@sections) do |section|
  json.extract! section, :id, :name, :book_id
  json.url section_url(section, format: :json)
end
