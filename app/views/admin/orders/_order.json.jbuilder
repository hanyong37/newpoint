json.extract! order, :id, :member_id, :memo, :address, :status, :feedback, :stars, :created_at, :updated_at
json.url order_url(order, format: :json)