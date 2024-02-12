class RecordsController < ApplicationController
  def index
    # Get the pet by id
    @pet = Pet.find(params[:pet_id])
    # Get all records for the pet
    @records = @pet.records
    # Filter records when a search query is present
    if params[:query].present?
      sql_subquery = "title ILIKE :query OR content ILIKE :query"
      @records = @records.where(sql_subquery, query: "%#{params[:query]}%")
    end
    # Get a new instance of record for Modal form in index page
    @record = Record.new
  end

  def show
    # Get the record by id - calling the set_record private method
    @record = set_record
  end

  def create
    # Create a new record with params from form
    # Permited through allow_params private method
    @record = Record.new(allow_params)
    # Get the pet by id
    @pet = Pet.find(params[:pet_id])
    # Set the pet for the record
    @record.pet = @pet
    if @record.save
      # If saved, redirect to the newly created record show page
      redirect_to pet_record_path(@pet, @record), notice: "Successfully created record."
    else
      # If not saved, render the new form again
      render action: 'new'
    end
  end

  def update
    # Get the pet record by id
    @record = Record.find(params[:id])
    # If the record is updated with the form params we allowed with private method
    if @record.update(allow_params)
      # Redirect to the pet records index page
      redirect_to pet_records_path, notice: "Successfully updated record."
    else
      # If not saved, render the edit form again
      render action: 'edit'
    end
  end

  def destroy
    # Get the pet record by id
    @record = Record.find(params[:id])
    # Get the pet by id
    @pet = Pet.find(@record.pet_id)
    # Destroy the record
    @record.destroy
    # Redirect to the pet records index page
    redirect_to pet_records_path, notice: "Successfully deleted record."
  end

  # Private Methods

  private

  # Get the record by id
  def set_record
    @record = Record.find(params[:id])
  end

  # Permit parameters from form submission
  def allow_params
    params.require(:record).permit(:title, :content, :pet_id, :title, :images, :videos, :files)
  end
end
