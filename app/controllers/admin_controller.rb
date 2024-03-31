class AdminController < ApplicationController
    def index
        @all_records = if params[:state] == 'all records'
            true
        else
            false
        end

        if @all_records

            @countries = Country.all
        else
        @countries = Country.where(soft_deleted_at: nil)
        end
    end
end