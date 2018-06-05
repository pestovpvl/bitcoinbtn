require "application_system_test_case"

class CryptosTest < ApplicationSystemTestCase
  setup do
    @crypto = cryptos(:one)
  end

  test "visiting the index" do
    visit cryptos_url
    assert_selector "h1", text: "Cryptos"
  end

  test "creating a Crypto" do
    visit cryptos_url
    click_on "New Crypto"

    fill_in "Amount Owner", with: @crypto.amount_owner
    fill_in "Cost Per", with: @crypto.cost_per
    fill_in "Symbol", with: @crypto.symbol
    fill_in "User", with: @crypto.user_id
    click_on "Create Crypto"

    assert_text "Crypto was successfully created"
    click_on "Back"
  end

  test "updating a Crypto" do
    visit cryptos_url
    click_on "Edit", match: :first

    fill_in "Amount Owner", with: @crypto.amount_owner
    fill_in "Cost Per", with: @crypto.cost_per
    fill_in "Symbol", with: @crypto.symbol
    fill_in "User", with: @crypto.user_id
    click_on "Update Crypto"

    assert_text "Crypto was successfully updated"
    click_on "Back"
  end

  test "destroying a Crypto" do
    visit cryptos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crypto was successfully destroyed"
  end
end
