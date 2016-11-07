json.extract! product, :id, :name, :desc, :price, :photo, :status, :category_id, :stock, :created_at, :updated_at
json.url product_url(product, format: :json)
