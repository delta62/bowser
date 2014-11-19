require 'sinatra/base'
require 'sinatra/json'
require 'pathname'

require_relative './mapper.rb'
require_relative './fileloader.rb'
require_relative './controllerfactory.rb'

class RestApp < Sinatra::Base
  configure do
    set :base, '/Users/sam'
  end

  get '/fs/*' do
    relpath = params[:splat][0]
    mapper = Bowser::Mapper.new(settings.base, relpath)
    path = mapper.map
    loader = Bowser::FileLoader.new
    factory = Bowser::ControllerFactory.new(loader)
    controller = factory.controller(path)
    controller.read do |resource|
      p resource
    end
    'hello world'
  end
end
