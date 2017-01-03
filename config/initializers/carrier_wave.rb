require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:   'AWS',
    aws_access_key_id: ENV['aws_access_key_id'],
    aws_secret_access_key:  ENV['aws_secret_access_key'],
    region:                 'ap-southeast-1'
  }


  config.fog_directory = ENV['AWS_BUCKET']
end
