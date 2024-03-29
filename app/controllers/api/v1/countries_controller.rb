module Api
  module V1
    class CountriesController < ApplicationController
      before_action :set_country, only: %i[ show ]
      api :GET, "/countries", "List Countries"
      api :GET, "/countries?currency=value", "Filter Countries by their currency"
      error :code => 401, :desc => "Unauthorized"
      error :code => 404, :desc => "Not Found", :meta => {:anything => "you can think of"}

      def index
        @countries = Country.all
        @countries = @countries.where('currency LIKE ?', "%#{params[:currency]}%") if params[:currency]
        if @countries
          render json: {status: "SUCCESS", message: "Fetched all the countries successfully", data: @countries}, status: :ok
        else
          render json: @countries.errors, status: :bad_request
        end
      end

      api :GET, "/v1/countries/alpha_code", "Fetch a single country by its alpha_2_code or alpha_3_code"
      error :code => 404, :desc => "Not Found"
      param :alpha_2_code, String, :desc => "Country alpha 2 code", :required => false
      param :alpha_3_code, String, :desc => "Country alpha 3 code", :required => false
      def show
        if @country.presence
          render json: @country
        else
          render json: {status: "Failure", code: 404,  message: "Record not found", data: @country}, status: :not_found
        end
      end

      private

      def set_country
        @country = Country.where('alpha_2_code = ? or alpha_3_code = ?', params[:id], params[:id]).first
      end
    end
  end
end
