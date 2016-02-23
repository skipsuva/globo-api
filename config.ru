# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)

# Action Cable requires that all classes are loaded in advance
Rails.application.eager_load!

run Rails.application

require 'rack/cors'
use Rack::Cors do

  # allow all origins in development
  allow do
    origins '*'
    resource '*', 
        :headers => :any, 
        :methods => [:get, :post, :delete, :patch, :put, :options]
  end
end
