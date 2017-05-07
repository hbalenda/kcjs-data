class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  def import
    Entry.import(params[:file])
    redirect_to root_url, notice: "OH MY GOD IT WORKED"
  end
end
