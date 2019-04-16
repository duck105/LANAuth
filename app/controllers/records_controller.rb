class RecordsController < ApplicationController
  def index
    @records = Record.all
  end
  
  def new
    @records = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path
    else
      render :new
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    
    flash[:alert] = "Record has beed deleted"
    redirect_to records_path
  end
  private

  def record_params
    params.require(:record).permit(:source_ip, :user_id)
  end
end
