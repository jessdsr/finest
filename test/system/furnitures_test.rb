require "application_system_test_case"

class FurnituresTest < ApplicationSystemTestCase
  setup do
    @furniture = furnitures(:one)
  end

  test "visiting the index" do
    visit furnitures_url
    assert_selector "h1", text: "furnitures"
  end

  test "should create furniture" do
    visit furnitures_url
    click_on "New furniture"

    fill_in "Address", with: @furniture.address
    fill_in "Name", with: @furniture.name
    click_on "Create furniture"

    assert_text "furniture was successfully created"
    click_on "Back"
  end

  test "should update furniture" do
    visit furniture_url(@furniture)
    click_on "Edit this furniture", match: :first

    fill_in "Address", with: @furniture.address
    fill_in "Name", with: @furniture.name
    click_on "Update furniture"

    assert_text "furniture was successfully updated"
    click_on "Back"
  end

  test "should destroy furniture" do
    visit furniture_url(@furniture)
    click_on "Destroy this furniture", match: :first

    assert_text "furniture was successfully destroyed"
  end
end
