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
  end

  test 'invalid without alpha 3 code' do
  end

  test 'invalid without currency' do
  end
end