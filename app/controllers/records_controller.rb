class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def show
    @record = set_record
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(params[:record])
    @pet = Pet.find(params[:pet_id])
    @record.pet = @pet
    @record.save
    if @record.save
      redirect_to @record, notice: "Successfully created record."
    else
      render action: 'new'
    end
  end

  def edit
    @record = Record.find(record_params[:id])
  end

  def update
    @record = Record.find(record_params[:id])
    if @record.update_attributes(params[:record])
      redirect_to @record, notice: "Successfully updated record."
    else
      render action: 'edit'
    end
  end

  def destroy
    @record = Record.find(record_params[:id])
    @record.destroy
    redirect_to records_url, notice: "Successfully destroyed record."
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def allow_params
    params.require(:record).permit(:date, :description, :pet_id)
  end
end
