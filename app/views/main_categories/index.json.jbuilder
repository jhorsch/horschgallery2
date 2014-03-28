json.array!(@main_categories) do |main_category|
  json.extract! main_category, :id, :title
  json.url main_category_url(main_category, format: :json)
end
