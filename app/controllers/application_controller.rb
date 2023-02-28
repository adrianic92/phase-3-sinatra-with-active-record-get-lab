class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    # look up the game in the database using its ID
    bakery = Bakery.find(params[:id])
    # send a JSON-formatted response of the game data
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # look up the game in the database using its ID
    baked_goods = BakedGood.all.order("price DESC")
    # send a JSON-formatted response of the game data
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # look up the game in the database using its ID
    most_expensive = BakedGood.all.order("price DESC").first
    # send a JSON-formatted response of the game data
    most_expensive.to_json
  end

end
