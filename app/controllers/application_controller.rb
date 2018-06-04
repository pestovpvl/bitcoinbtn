class ApplicationController < ActionController::Base
    def lookup
        @symbol = params[:sym]
    end
end
