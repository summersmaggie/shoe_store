require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/brand_store.rb")
require("./lib/brand.rb")
require("./lib/store.rb")
require("pry")
