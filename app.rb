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
  @brand = Brand.new({:brand_name => brand_name, :price => price})
  if @brand.save()
    redirect '/brands'
  else
    erb :brand_error
  end
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch("id").to_i())
  erb :brand
end

delete('/brands/:id') do
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.delete
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
  @store = Store.create({:store_name => store_name, :location => location})
  if @store.save()
    redirect '/stores'
  else
    erb :store_error
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @available_brands = Brand.all() - @store.brands
  erb :store
end

post('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  new_brand = Brand.find(params.fetch("brand_id"))
  @store.brands.push(new_brand)
  @available_brands = Brand.all() - @store.brands
  erb :store
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch("id").to_i())
  erb :edit_store
end

patch('/stores/:id') do
  store_name = params.fetch('store_name')
  location = params.fetch('location')
  @store = Store.find(params.fetch("id").to_i())
  @store.update({:store_name => store_name, :location => location})
  @available_brands = Brand.all() - @store.brands
  erb :store
end

delete('/stores/:id') do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete
  redirect '/stores'
end
