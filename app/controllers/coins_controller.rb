class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :edit, :update, :destroy]
  before_action :correct_person, only: [:show, :edit, :update, :destroy]
 
  # GET /coins
  # GET /coins.json
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

  # GET /coins/1
  # GET /coins/1.json
  def show
    @coins = Coin.all
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/?limit=1000'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @show_coins = JSON.parse(@response)
   
  end

  # GET /coins/new
  def new
    @coin = Coin.new
    @coins = Coin.all
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/?limit=1000'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @show_coins_new = JSON.parse(@response)
   
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins
  # POST /coins.json
  def create
    @coin = Coin.new(coin_params)
   
    respond_to do |format|
      if @coin.save
        format.html { redirect_to @coin, notice: 'Coin was successfully created.' }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1
  # PATCH/PUT /coins/1.json
  def update
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to @coin, notice: 'Coin was successfully updated.' }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1
  # DELETE /coins/1.json
  def destroy
    @coin.destroy
    respond_to do |format|
      format.html { redirect_to coins_url, notice: 'Coin was successfully destroyed.' }
      format.json { head :no_content }
    end
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
