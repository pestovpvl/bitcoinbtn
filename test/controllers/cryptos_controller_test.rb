require 'test_helper'

class CryptosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crypto = cryptos(:one)
  end

  test "should get index" do
    get cryptos_url
    assert_response :success
  end

  test "should get new" do
    get new_crypto_url
    assert_response :success
  end

  test "should create crypto" do
    assert_difference('Crypto.count') do
      post cryptos_url, params: { crypto: { amount_owner: @crypto.amount_owner, cost_per: @crypto.cost_per, symbol: @crypto.symbol, user_id: @crypto.user_id } }
    end

    assert_redirected_to crypto_url(Crypto.last)
  end

  test "should show crypto" do
    get crypto_url(@crypto)
    assert_response :success
  end

  test "should get edit" do
    get edit_crypto_url(@crypto)
    assert_response :success
  end

  test "should update crypto" do
    patch crypto_url(@crypto), params: { crypto: { amount_owner: @crypto.amount_owner, cost_per: @crypto.cost_per, symbol: @crypto.symbol, user_id: @crypto.user_id } }
    assert_redirected_to crypto_url(@crypto)
  end

  test "should destroy crypto" do
    assert_difference('Crypto.count', -1) do
      delete crypto_url(@crypto)
    end

    assert_redirected_to cryptos_url
  end
end
