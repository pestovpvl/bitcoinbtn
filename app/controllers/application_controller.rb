class ApplicationController < ActionController::Base
    before_action :set_locale
    def set_locale
        logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
        I18n.locale = extract_locale_from_accept_language_header
        logger.debug "* Locale set to '#{I18n.locale}'"
    end
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
    private
        def extract_locale_from_accept_language_header
        request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
        end
end
