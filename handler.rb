require "json"
require "open-uri"
require "aws-sdk-s3"

S3 = Aws::S3::Client.new

def fetch(event:, context:)
  data = JSON.parse(URI.open("#{ENV["AIRTABLE_URL"]}?api_key=#{ENV["AIRTABLE_KEY"]}").read)["records"].map { |record| record["fields"] }
  S3.put_object(bucket: ENV["BUCKET"], key: "data.json", body: result = {data: data}.to_json, acl: "public-read", content_type: "application/json")
end
