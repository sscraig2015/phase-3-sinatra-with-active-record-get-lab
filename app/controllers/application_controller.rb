class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do 
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.all.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.sort_by {|item| item.price}.reverse!
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do 
    baked_goods = BakedGood.all.max { |a, b| a.price <=> b.price }
    baked_goods.to_json
  end

end
