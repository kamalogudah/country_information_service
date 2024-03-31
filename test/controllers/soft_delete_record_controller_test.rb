require 'minitest/autorun'

class SoftDeleteRecordControllerTest < ActionController::TestCase
  def setup
    @country = countries(:valid)
  end

  def test_create
    assert_nil @country.soft_deleted_at
    post :create, params: {id: @country.id }
    assert_redirected_to "/admin/index"
    refute_nil @country.reload.soft_deleted_at
  end
end


