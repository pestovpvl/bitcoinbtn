class HomeController < ApplicationController
  before_action :set_coin, only: [:show, :edit, :update, :destroy]
  before_action :correct_person, only: [:show, :edit, :update, :destroy]
  def index
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
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_coin
    @coin = Coin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def coin_params
    params.require(:coin).permit(:symbol, :person_id, :cost_per, :amount_owned)
  end
  def correct_person
    @correct = current_person.coins.find_by(id: params[:id])
    redirect_to coins_path, notice: "Пользователи не могут просматривать монеты других участников" if @correct.nil?
  end
end
