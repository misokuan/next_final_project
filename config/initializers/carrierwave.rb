# config.fog_provider = 'fog' # 'fog/aws' etc. Defaults to 'fog'
# config.fog_credentials = {  } # Provider specific credentials

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'
    end
  end

  if Rails.env.production?
    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'
    end
  end                        # required

  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY'],                        # required
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required
    # region:                'us-west-2',                  # optional, defaults to 'us-east-1'
    # path_style:            true,
    # host:                  'https://bucketname.s3.amazonaws.com',             # optional, defaults to nil
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  
  config.fog_directory  = ENV['AWS_BUCKET']                          # required
  # config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end

# CarrierWave.configure do |config|  # Use local storage if in development or test
#  if Rails.env.development? || Rails.env.test?
#    CarrierWave.configure do |config|
#      config.fog_provider = 'fog/aws'
#    end
#  end  # Use AWS storage if in production
#  if Rails.env.production?
#    CarrierWave.configure do |config|
#      config.fog_provider = 'fog/aws'
#    end
#  end  config.fog_credentials = {
#    :provider               => 'AWS',                             # required
#    :aws_access_key_id      => ENV['AWS_KEY'],            # required
#    :aws_secret_access_key  => ENV['AWS_SECRET'],     # required
#    :region                 => ENV['AWS_REGION']                        # optional, defaults to 'us-east-1'
#  }
#  config.fog_directory  = ENV['AWS_BUCKET']               # required
#  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
#  #config.fog_public     = false                                  # optional, defaults to true
#  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
# end