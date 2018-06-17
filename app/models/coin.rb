class Coin < ApplicationRecord
    belongs_to :person
    before_validation :make_only_symbol_for_coin
  private
    def make_only_symbol_for_coin
      self.symbol = symbol.split.first
    end
end


