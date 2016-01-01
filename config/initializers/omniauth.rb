OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '861668647285616', 'a53101f8417ce07740b65d1dd8378eb6',
            scope: ['email', 'public_profile']
end
