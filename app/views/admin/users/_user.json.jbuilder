json.extract! user, :id, :name, :password, :is_admin, :mobile_number, :wx_code, :created_at, :updated_at
json.url user_url(user, format: :json)
