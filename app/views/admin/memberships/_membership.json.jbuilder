json.extract! membership, :id, :user_id, :name, :created_at, :updated_at
json.url membership_url(membership, format: :json)