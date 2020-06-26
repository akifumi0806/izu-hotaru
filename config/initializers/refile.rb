require 'refile/s3'

if Rails.env.production? # 本番環境の場合はS3へアップロード
  aws = {
    access_key_id: ENV['AKIA4SQLTKXULKEE5S7O'], # アクセスキーID
    secret_access_key: ENV['C6RlT4jkKSM/pQL/7BV8SoktmycSwRLO9mhy7+oP'], # シークレットアクセスキー
    region: 'ap-northeast-1', # リージョン
    bucket: 'izu-hotaru.bucket', # バケット名
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end