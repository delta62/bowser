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

  get '/*' do
    mapper = Bowser::Mapper.new(settings.base)
    path = mapper.map(params[:splat][0])
    loader = Bowser::FileLoader.new
    factory = Bowser::ControllerFactory.new(loader)
    controller = factory.controller(path)
    json controller.as_json(mapper)
  end
end
