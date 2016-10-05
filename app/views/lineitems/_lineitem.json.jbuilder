json.extract! lineitem, :id, :product_id, :amount, :order_id, :price, :description, :created_at, :updated_at
json.url lineitem_url(lineitem, format: :json)