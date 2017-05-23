require 'sinatra'
require 'json'

post '/' do
  alexa_request = Alexa::Request.new(File.read("sample_json.rb"))
end
