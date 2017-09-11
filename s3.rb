require 'aws-sdk'

def connect_to_s3()
  Aws.config.update({
   credentials: Aws::Credentials.new('AKIAIRAA7DAQQSL4ANSA', '3k5gzma6KC6sxXwXMbJk8MCJJcPNEGhq4xrKIXjp')
})
  s3 = Aws::S3::Resource.new(region: 'us-east-2')
  bucket = s3.bucket('buckethed')
  name = File.basename "mswresults.csv"
  obj = s3.bucket('buckethed').object('mswresults.csv')
  obj.upload_file('mswresults.csv')
end
connect_to_s3()
