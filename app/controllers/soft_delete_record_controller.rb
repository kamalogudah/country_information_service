class SoftDeleteRecordController < ApplicationController
  def create
    @record = Country.find(params[:id])
    @record.soft_deleted_at = Time.now
    if @record.save
      flash[:notice] = 'Record was successfully deleted .'
      redirect_to admin_index_url
    else
      flash[:notice] = 'Could not delete the record.'
      redirect_to admin_index_url
    end
  end
end