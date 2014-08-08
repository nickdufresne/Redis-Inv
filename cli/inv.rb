require 'restclient'
require 'oj'

module Inv
  def self.endpoint=(url)
    @url = url
  end

  def self.endpoint
    @url
  end

  def self.redis=(redis)
    @redis = redis
  end

  def redis
    @redis
  end

  def self.reset!
    if ENV['rails_env'] == "dev"
      post("reset")
    end
  end

  def self.post(url, payload = {})
    response = RestClient.post("#{endpoint}/#{url}", Oj.dump(payload))
    Oj.load(response.body)
  end
end