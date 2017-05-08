def log(message)
    Rails.logger.info(message)
    puts message
end

class GraphController < ApplicationController
  def index
    # GENDER
    @genders = Entry.all.pluck(:gender).uniq
    @selected_gender = params[:gender]

    @races = Entry.all.pluck(:race).uniq
    @selected_race = params[:race]

    @offenses = Entry.all.pluck(:offense).uniq
    @selected_offense = params[:offense]

    @entries = Entry.where("gender LIKE (?) AND offense LIKE (?) AND race LIKE (?)", "#{@selected_gender}%", "%#{@selected_offense}%", "%#{@selected_race}%")
    @count = @entries.count
  end
end
