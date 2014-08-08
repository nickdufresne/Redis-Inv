require 'rubygems'
require 'bundler/setup'
require 'redis'
require 'puma'
require 'sinatra'
require 'json'
require File.expand_path("../inv", __FILE__)

configure { set :server, :puma }

$redis = Redis.new

post '/batch' do
  b = Inv::Batch.new(JSON.parse(request.body.read))
  if b.run
    JSON.generate({
      success: true,
      id: b.id
    })
  else
    JSON.generate({
      success: false,
      errors: ["Could not create batch!"]
    })
  end
end

get '/' do
  JSON.generate({
    hello: "World"
  })
end