Rails.application.config.middleware.use OmniAuth::Builder do
    provider :wechat, Rails.application.secrets.WECHAT_APP_ID, Rails.application.secrets.WECHAT_APP_SECRET, :authorize_params => {:scope => "snsapi_base"}
end
