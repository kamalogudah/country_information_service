require "test_helper"

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'valid country' do
    country = countries(:valid)
    assert country.valid?
  end

  test 'invalid without name' do
    country = Country.new(alpha_2_code: "GO", alpha_3_code: "GOT", currency: "GD")
    refute country.valid?, 'country is invalid without a name'
    assert_not_nil country.errors[:name], 'no validation error for name present'
  end

  test 'invalid without alpha 2 code' do
    country = Country.new(name: "Ruby", alpha_3_code: "GOT", currency: "GD")
    refute country.valid?, 'country is invalid without an alpha 2 code '
    assert_not_nil country.errors[:alpha_2_code], 'no validation error for alpha_2_code present'
  end

  test 'invalid without alpha 3 code' do
    country = Country.new(name: "Ruby", alpha_2_code: "GO", currency: "GD")
    refute country.valid?, 'country is invalid without an alpha 3 code '
    assert_not_nil country.errors[:alpha_3_code], 'no validation error for alpha_3_code present'
  end

  test 'invalid without currency' do
    country = Country.new(name: "Ruby", alpha_2_code: "GO", alpha_3_code: "GOT")
    refute country.valid?, 'country is invalid without a currency '
    assert_not_nil country.errors[:currency], 'no validation error for currency present'
  end
end