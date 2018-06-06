json.extract! coin, :id, :symbol, :person_id, :cost_per, :amount_owned, :created_at, :updated_at
json.url coin_url(coin, format: :json)
