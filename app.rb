require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/brand")
require("./lib/store")
require("pry")

get('/') do
  erb(:home)
end

#brands
get('/brands/new') do
  erb(:brand_form)
end

get('/brands') do
  @brands = Brand.all()
  erb :brands
end

post('/brands') do
  brand_name = params.fetch('brand_name')
  price = params.fetch('price').to_i
  brand = Brand.create({:brand_name => brand_name, :price => price})
  redirect '/brands'
end

#stores
get('/stores/new') do
  erb :store_form
end

get('/stores') do
  @stores = Store.all()
  erb :stores
end

post('/stores') do
  store_name = params.fetch('store_name')
  location = params.fetch('location')
  store = Store.create({:store_name => store_name, :location => location})
  redirect '/stores'
end
