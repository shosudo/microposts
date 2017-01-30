CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIQEUNOXCZLCVHTWQ',
    aws_secret_access_key: '9fAWZ4poSn9rETejnsWkWew1GHi1jA6eqXefUdHY',
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'dummy-academy'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dummy-academy'

    when 'development'
      config.fog_directory = 'dev.dummy-academy'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.dummy-academy'

    when 'test'
      config.fog_directory = 'test.dummy-academy'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.dummy-academy'
  end
  
  config.cache_storage = :fog #キャッシュの場所をS3に変更
  config.cache_dir = "#{Rails.root}/tmp/uploads" #for Heroku
end