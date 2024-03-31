require 'minitest/autorun'

module Api
  module V1
    class CountriesControllerTest < ActionController::TestCase
      def setup
        @country = countries(:valid)
      end

      def test_index
        get :index
        json = JSON.parse(@response.body)
        assert_response 200
        assert_includes @country.name, json["data"].first["name"]
        assert_equal 2, json["data"].count
      end

      def test_show_with_alpha_2_code
        get :show, params: {id: 'MY' }
        json = JSON.parse(@response.body)
        assert_response 200
        assert_equal "Ruby World", json["name"]
      end

      def test_show_with_alpha_3_code
        get :show, params: {id: 'MYS' }
        json = JSON.parse(@response.body)
        assert_response 200
        assert_equal "Ruby World", json["name"]
      end

      def test_show_with_invalid_alpha_3_code
        get :show, params: {id: 'MYSU' }
        json = JSON.parse(@response.body)
        assert_response 404
        assert_equal "Record not found", json["message"]
      end
    end
  end
end
