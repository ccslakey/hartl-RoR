if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAIC4YLPF7OU3JVK6Q'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['hartlimagebucket']
  end
end