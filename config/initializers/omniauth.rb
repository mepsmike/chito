OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '464996190340372', '8869c3285e00ecf9be818750f9559dc4',
  :info_fields => 'email, name, picture'
end