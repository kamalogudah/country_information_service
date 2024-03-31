require 'minitest/autorun'

class RestoreRecordControllerTest < ActionController::TestCase
  def setup
    @country = countries(:soft_deleted)
  end

  def test_create
    refute_nil @country.soft_deleted_at
    post :create, params: {id: @country.id }
    assert_nil @country.reload.soft_deleted_at
    assert_redirected_to "/admin/index"
  end
end
