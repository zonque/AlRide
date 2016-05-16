class WelcomeController < ApplicationController
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
end
