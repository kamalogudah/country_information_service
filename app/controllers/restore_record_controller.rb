class RestoreRecordController < ApplicationController
    def create
        @record = Country.find(params[:id])

        @record.soft_deleted_at = nil
      if @record.save
       flash[:notice] = 'Country was successfully restored.'
       redirect_to admin_index_url
    else
        flash[:notice] = 'Could not restored the record.'
        redirect_to admin_index_url
    end
end


end