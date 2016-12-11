Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1823388547944188', '307a668c9a2695224cdc397dcda1eba9',  { :client_options => {:provider_ignores_state => true, :ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end                                                                                 