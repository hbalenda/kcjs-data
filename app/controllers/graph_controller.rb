class GraphController < ApplicationController
  def index
    @genders = Entry.all.pluck(:gender).uniq
    @selected_gender = params[:gender]

    @races = Entry.all.pluck(:race).uniq
    @selected_race = params[:race]

    @offenses = Entry.all.pluck(:offense).uniq
    @selected_offense = params[:offense]

    if params[:dv].empty?
      @selected_dv = "%"
    else
      @selected_dv = to_boolean(params[:dv])
    end

    @years = Entry.all.pluck(:year).uniq
    @selected_start_year = params[:start_year] ? params[:start_year] : 2010
    @selected_end_year = params[:end_year] ? params[:end_year] : 2011

    @entries = Entry.where("gender LIKE (?) AND offense LIKE (?) AND race LIKE (?) AND dv LIKE (?) AND year >= (?) AND year <= (?)", "#{@selected_gender}%", "%#{@selected_offense}%", "%#{@selected_race}", @selected_dv, @selected_start_year, @selected_end_year).order(race: :asc, offense: :asc, details: :asc, dv: :desc, year: :asc)
    @count = @entries.count
    @total = Entry.where("year >= (?) AND year <= (?)", @selected_start_year, @selected_end_year).count
  end
  def to_boolean(str)
    str == 'true'
  end
  def log(message)
      Rails.logger.info(message)
      puts message
  end
end
