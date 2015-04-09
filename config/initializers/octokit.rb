Octokit.configure do |config|
  config.client_id = Rails.application.secrets.octokit_client_id
  config.client_secret = Rails.application.secrets.octokit_client_secret
end

Octokit.middleware = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache, :shared_cache => false
  builder.adapter Faraday.default_adapter
end
