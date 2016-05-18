class EntriesController < ApplicationController
  before_action :find_entry, only: [ :show, :remove, :send_email ]

  def index
    limit = Time.now - 3.hours
    @offers = Entry.where(entry_type: :offer).where("date >= ?", limit).order(:date)
    @requests = Entry.where(entry_type: :request).where("date >= ?", limit).order(:date)

    header = File.read(Rails.root.join("config", "page_header.#{I18n.locale}.md")) rescue nil
    if header
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
      @header_html = markdown.render(header)
    else
      @header_html = nil
    end
  end

  def show
    if @entry.is_request?
      @title = t('name_is_looking_for_a_ride', name: @entry.name)
    else
      @title = t('name_has_a_ride_to_share', name: @entry.name)
    end
  end

  def new
    @entry = Entry.new
    @entry.entry_type = params[:entry_type]
    @entry.seats = 1

    if @entry.is_offer?
      @entry.driver = true
    end

    @title = "New #{@entry.entry_type}"
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.locale = I18n.locale
    @title = "New #{@entry.entry_type}"

    if @entry.save
      redirect_to root_path, notice: t('entry_was_successfully_created')
    else
      render :new
    end
  end

  def remove
    if @entry.nil?
      redirect_to root_path, flash: { error: t('entry_does_not_exist') }
      return
    end

    if @entry.secret != params[:secret]
      redirect_to root_path, flash: { error: t('invalid_removal_link') }
      return
    end

    @entry.destroy
    redirect_to root_path, flash: { success: t('entry_was_removed') }
  end

  def send_email
    UserMailer.contact_entry_person(@entry, params[:from], params[:text], params[:would_drive]).deliver_now
    redirect_to root_path, flash: { success: t('mail_has_been_sent') }
  end

  private

  def find_entry
    @entry = Entry.find(params[:id] || params[:entry_id]) rescue nil
  end

  def entry_params
    params.require(:entry).permit(:entry_type, :name, :email, :phone, :date, :from, :to, :seats, :notes, :driver)
  end

end
