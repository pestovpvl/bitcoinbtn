class ApplicationController < ActionController::Base
    def lookup
        require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)

    @lookup_coins = JSON.parse(@response)

        @symbol = params[:sym]
        if @symbol
            @symbol = @symbol.upcase
        end
        
        if @symbol == ""
            @symbol = "Вы забыли выбрать валюту, пожалуйста сделайте выбор"
        end

    end
    def about

    end
end
