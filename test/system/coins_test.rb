require "application_system_test_case"

class CoinsTest < ApplicationSystemTestCase
  setup do
    @coin = coins(:one)
  end

  test "visiting the index" do
    visit coins_url
    assert_selector "h1", text: "Coins"
  end

  test "creating a Coin" do
    visit coins_url
    click_on "New Coin"

    fill_in "Amount Owned", with: @coin.amount_owned
    fill_in "Cost Per", with: @coin.cost_per
    fill_in "Person", with: @coin.person_id
    fill_in "Symbol", with: @coin.symbol
    click_on "Create Coin"

    assert_text "Coin was successfully created"
    click_on "Back"
  end

  test "updating a Coin" do
    visit coins_url
    click_on "Edit", match: :first

    fill_in "Amount Owned", with: @coin.amount_owned
    fill_in "Cost Per", with: @coin.cost_per
    fill_in "Person", with: @coin.person_id
    fill_in "Symbol", with: @coin.symbol
    click_on "Update Coin"

    assert_text "Coin was successfully updated"
    click_on "Back"
  end

  test "destroying a Coin" do
    visit coins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coin was successfully destroyed"
  end
end
