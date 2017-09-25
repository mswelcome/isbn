#require 'aws-sdk'
#load './local_env.rb'

def connect_to_s3()
  s3 = Aws::S3::Resource.new(region: 'us-east-2')
  bucket = s3.bucket('curoch')
  name = File.basename "mswresults.csv"
  obj = s3.bucket('curoch').object('mswresults.csv')
  obj.upload_file('mswresults.csv')
end
connect_to_s3()
