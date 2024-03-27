module Api
    module V1
        class CountriesController < ApplicationController
            def index
                @countries = Country.all

                if @countries
                    render json: {status: "SUCCESS", message: "Fetched all the countries successfully", data: @countries}, status: :ok
                  else
                    render json: @countries.errors, status: :bad_request
                  end
            end 
        end
    end
end
