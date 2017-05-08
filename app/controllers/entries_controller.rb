class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  def show
  end
  def import
    Entry.import(params[:file])
    redirect_to show_entries_path, notice: "OH MY GOD IT WORKED"
  end
end
