class WelcomeController < ApplicationController
  def index
    @offers = Entry.where(:entry_type => :offer)
    @requests = Entry.where(:entry_type => :request)
  end
end
