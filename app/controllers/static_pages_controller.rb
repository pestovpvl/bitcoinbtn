class StaticPagesController < ApplicationController
  def about
  end
  def history
    @coins = Coin.all
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/?limit=1000'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coins = JSON.parse(@response)
    @profit_lost = 0
    @profit_summ = 0
  end
end
