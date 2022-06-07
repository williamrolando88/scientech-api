json.extract! product, :id, :name, :description, :published, :image, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
