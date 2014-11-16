require 'sinatra/base'
require 'sinatra/json'
require 'pathname'

class Bowser < Sinatra::Base
  configure do
    set :base, '/Users/sam'
  end

  get '/fs/*' do
    entries = [ ]
    base = settings.base
    path = params[:splat][0]
    fullpath = Pathname.new(base) + path
    Dir.entries(fullpath.to_s).each do |name|
      entry = { :name => name }
      if File.directory? (fullpath + name).to_s
        entry[:type] = 'd'
      else
        entry[:type] = 'f'
      end
      entries.push entry
    end
    json({ :entries => entries })
  end
end
