class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries/1
  # GET /entries/1.json
  def show
    @title = "Details for #{@entry.entry_type} from #{@entry.name}"
  end

  # GET /entries/new
  def new
    @entry = Entry.new
    @entry.entry_type = params[:entry_type]
    @entry.seats = 1
    @title = "New #{@entry.entry_type}"
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @title = "New #{@entry.entry_type}"

    respond_to do |format|
      if @entry.save
        format.html { redirect_to root_path, notice: 'Entry was successfully created.' }
        format.json { render action: 'show', status: :created, location: @entry }
      else
        format.html { render action: 'new' }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  def send_email
    redirect_to root_path, flash: { success: 'Your mail has been sent' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:entry_type, :name, :email, :phone, :date, :from, :to, :seats, :notes)
    end

end
