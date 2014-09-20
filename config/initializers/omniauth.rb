OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_SECRET, provider_ignores_state: true,
  :scope => 'email,user_birthday,read_stream', :display => 'popup'
end

