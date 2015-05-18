class EntriesController < ApplicationController
  before_action :set_entry, only: [:show]

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

  def remove
    @entry = Entry.find_by_id(params[:entry_id])

    if @entry.nil?
      redirect_to root_path, flash: { error: 'Entry does not exist' }
      return
    end

    if @entry.secret != params[:secret]
      redirect_to root_path, flash: { error: 'Invalid removal link' }
      return
    end

    @entry.destroy
    redirect_to root_path, flash: { success: 'Entry was removed, thanks!' }
  end

  def send_email
    @entry = Entry.find(params[:entry_id])
    UserMailer.contact_entry_person(@entry, params[:from], params[:text]).deliver
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
