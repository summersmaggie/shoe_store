require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


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

get('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @available_brands = Brand.all() - @store.brands
  erb(:store)
end
