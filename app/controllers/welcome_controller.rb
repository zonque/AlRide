class WelcomeController < ApplicationController
  def index
    limit = Time.now - 3.hours
    @offers = Entry.where(:entry_type => :offer).where("date >= ?", limit)
    @requests = Entry.where(:entry_type => :request).where("date >= ?", limit)
  end
end
