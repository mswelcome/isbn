require 'aws-sdk'
load './local_env.rb'

  def dl_s3()
  s3 = Aws::S3::Resource.new(region: 'us-east-2')

  # Create the object to retrieve
  obj = s3.bucket('curoch').object('mswresults.csv')

  # Get the item's content and save it to a file
  obj.get(response_target: './dl_mswresults.csv')
end

dl_s3()
